import os
import pty
import select
import subprocess
import sys
import time


ROOT = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(ROOT, "a-vim")


def cleanup(paths):
    for path in paths:
        try:
            os.unlink(path)
        except FileNotFoundError:
            pass


def run_editor(args, payload, timeout=3.0):
    master, slave = pty.openpty()
    proc = subprocess.Popen(
        [BIN] + args,
        stdin=slave,
        stdout=slave,
        stderr=slave,
        cwd=ROOT,
        close_fds=True,
    )
    os.close(slave)

    time.sleep(0.15)
    if payload:
        os.write(master, payload)

    deadline = time.time() + timeout
    output = bytearray()
    while time.time() < deadline:
        if proc.poll() is not None:
            break
        ready, _, _ = select.select([master], [], [], 0.05)
        if ready:
            try:
                chunk = os.read(master, 65536)
                if chunk:
                    output.extend(chunk)
            except OSError:
                break

    for _ in range(20):
        ready, _, _ = select.select([master], [], [], 0.05)
        if not ready:
            break
        try:
            chunk = os.read(master, 65536)
            if not chunk:
                break
            output.extend(chunk)
        except OSError:
            break

    proc.wait(timeout=timeout)
    os.close(master)
    return bytes(output), proc.returncode


def main():
    out_file = os.path.join(ROOT, "tmp_test_out.txt")
    dirty_file = os.path.join(ROOT, "tmp_dirty.txt")
    highlight_file = os.path.join(ROOT, "tmp_highlight.c")
    scroll_file = os.path.join(ROOT, "tmp_scroll.c")
    cursor_file = os.path.join(ROOT, "tmp_cursor.asm")
    page_file = os.path.join(ROOT, "tmp_page.txt")
    cleanup([out_file, dirty_file, highlight_file, scroll_file, cursor_file, page_file])

    payload = b"ihello world\nsecond line\x1b:wq\r"
    output, rc = run_editor([out_file], payload)
    assert rc == 0, f"editor exited with {rc}"
    with open(out_file, "rb") as fh:
        data = fh.read()
    assert data == b"hello world\nsecond line", data

    output, rc = run_editor([dirty_file], b"iabc\x1b:q\r:q!\r")
    assert rc == 0, f"dirty-quit run exited with {rc}"
    assert b"unsaved changes" in output, output[:2000]

    with open(highlight_file, "wb") as fh:
        fh.write(b"int main() { return 0; } // comment\n")

    output, rc = run_editor([highlight_file], b":q!\r")
    assert rc == 0, f"highlight run exited with {rc}"
    assert b"\x1b[96m" in output or b"\x1b[90m" in output, output[:2000]

    with open(scroll_file, "wb") as fh:
        fh.write((b"int main() { return 0; } // comment\n") * 40)

    output, rc = run_editor([scroll_file], b":q!\r")
    assert rc == 0, f"scrollbar run exited with {rc}"
    assert b"#" in output, output[:2000]

    output, rc = run_editor([cursor_file], b"itest this is working?\x1bx:wq\r")
    assert rc == 0, f"cursor-position run exited with {rc}"
    with open(cursor_file, "rb") as fh:
        data = fh.read()
    assert data == b"test this is working", data
    assert b"\x1b[6 q" in output, output[:2000]

    with open(page_file, "wb") as fh:
        for index in range(1, 81):
            fh.write(f"line {index:02d}\n".encode())

    output, rc = run_editor([page_file], b"\x1b[6~\x1b[5~:q!\r")
    assert rc == 0, f"page-nav run exited with {rc}"
    assert b"Ln 23/81" in output, output[:4000]
    assert b"Ln 1/81" in output, output[:4000]

    cleanup([out_file, dirty_file, highlight_file, scroll_file, cursor_file, page_file])

    print("smoke tests passed")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"smoke test failed: {exc}", file=sys.stderr)
        sys.exit(1)
