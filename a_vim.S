# noqa: SIZE_OK - Intentionally self-contained freestanding assembly program; multi-file build changes are outside scope.
.intel_syntax noprefix

.ifdef FREEBSD
.equ SYS_exit,        1
.equ SYS_read,        3
.equ SYS_write,       4
.equ SYS_open,        5
.equ SYS_close,       6
.equ SYS_link,        9
.equ SYS_unlink,      10
.equ SYS_getpid,      20
.equ SYS_ioctl,       54
.equ SYS_fsync,       95
.equ SYS_fchmod,      124
.equ SYS_rename,      128
.equ SYS_poll,        209
.equ SYS_sigaction,   416
.equ SYS_mmap,        477
.equ SYS_fstat,       551

.equ O_CREAT,         0x0200
.equ O_EXCL,          0x0800
.equ O_DIRECTORY,     0x00020000
.equ O_NOFOLLOW,      0x0100
.equ O_CLOEXEC,       0x00100000

.equ MAP_ANON,        0x1000

.equ TCGETS,          0x402c7413
.equ TCSETS,          0x802c7414
.equ TIOCGWINSZ,      0x40087468

.equ IXON,            0x0200
.equ CS8,             0x00000300
.equ ICANON,          0x0100
.equ IEXTEN,          0x0400
.equ ISIG,            0x0080

.equ SIGTSTP,         18

.equ TERMIOS_VTIME,   33
.equ TERMIOS_VMIN,    32
.equ TERMIOS_SIZE,    44

.equ STAT_BUFFER_SIZE, 232
.equ STAT_ST_SIZE,    112
.equ STAT_ST_MTIME_SEC, 64
.equ STAT_ST_MTIME_NSEC, 72
.else
.equ SYS_read,        0
.equ SYS_write,       1
.equ SYS_open,        2
.equ SYS_close,       3
.equ SYS_fstat,       5
.equ SYS_poll,        7
.equ SYS_mmap,        9
.equ SYS_sigaction,   13
.equ SYS_rt_sigreturn, 15
.equ SYS_ioctl,       16
.equ SYS_getpid,      39
.equ SYS_exit,        60
.equ SYS_fsync,       74
.equ SYS_rename,      82
.equ SYS_unlink,      87
.equ SYS_fchmod,      91
.equ SYS_renameat2,   316

.equ O_CREAT,         64
.equ O_EXCL,          128
.equ O_DIRECTORY,     0x10000
.equ O_NOFOLLOW,      0x20000
.equ O_CLOEXEC,       0x80000

.equ MAP_ANON,        32

.equ TCGETS,          0x5401
.equ TCSETS,          0x5402
.equ TIOCGWINSZ,      0x5413

.equ IXON,            0x0400
.equ CS8,             0x00000030
.equ ICANON,          0x0002
.equ IEXTEN,          0x8000
.equ ISIG,            0x0001

.equ SIGTSTP,         20
.equ SA_RESTORER,     0x04000000

.equ TERMIOS_VTIME,   22
.equ TERMIOS_VMIN,    23
.equ TERMIOS_SIZE,    36

.equ STAT_BUFFER_SIZE, 144
.equ STAT_ST_SIZE,    48
.equ STAT_ST_MTIME_SEC, 88
.equ STAT_ST_MTIME_NSEC, 96
.endif

.equ ENOENT,          2
.equ EINTR,           4

.equ STDIN_FD,        0
.equ STDOUT_FD,       1
.equ STDERR_FD,       2

.equ O_RDONLY,        0
.equ O_WRONLY,        1

.equ S_IFMT,          0xf000
.equ S_IFREG,         0x8000

.equ STAT_ST_DEV,     0
.equ STAT_ST_INO,     8
.equ STAT_ST_MODE,    24

.ifndef FREEBSD
.equ AT_FDCWD,        -100
.equ RENAME_NOREPLACE, 1
.endif

.equ PROT_READ,       1
.equ PROT_WRITE,      2
.equ MAP_PRIVATE,     2

.equ POLLIN,          0x0001

.equ BRKINT,          0x0002
.equ ICRNL,           0x0100
.equ INPCK,           0x0010
.equ ISTRIP,          0x0020
.equ OPOST,           0x0001
.equ ECHO,            0x0008

.equ SIGHUP,          1
.equ SIGINT,          2
.equ SIGQUIT,         3
.equ SIGPIPE,         13
.equ SIGTERM,         15
.equ SIG_IGN,         1

.equ TERMIOS_IFLAG,   0
.equ TERMIOS_OFLAG,   4
.equ TERMIOS_CFLAG,   8
.equ TERMIOS_LFLAG,   12

.equ WS_ROW,          0
.equ WS_COL,          2

.equ MODE_NORMAL,     0
.equ MODE_INSERT,     1
.equ MODE_COMMAND,    2

.equ NEWLINE_UNKNOWN, 0
.equ NEWLINE_LF,      1
.equ NEWLINE_CRLF,    2

.equ SYNTAX_NONE,     0
.equ SYNTAX_CLIKE,    1
.equ SYNTAX_ASM,      2
.equ SYNTAX_HASH,     3

.equ COLOR_DEFAULT,   0
.equ COLOR_KEYWORD,   1
.equ COLOR_STRING,    2
.equ COLOR_NUMBER,    3
.equ COLOR_COMMENT,   4
.equ COLOR_GUTTER,    5
.equ COLOR_SCROLL_TRACK, 6
.equ COLOR_SCROLL_THUMB, 7

.equ KEY_ESC,         27
.equ KEY_ENTER,       13
.equ KEY_BACKSPACE,   127
.equ KEY_ARROW_LEFT,  1000
.equ KEY_ARROW_RIGHT, 1001
.equ KEY_ARROW_UP,    1002
.equ KEY_ARROW_DOWN,  1003
.equ KEY_DELETE,      1004
.equ KEY_HOME,        1005
.equ KEY_END,         1006
.equ KEY_PAGEUP,      1007
.equ KEY_PAGEDOWN,    1008

.equ EDIT_CAPACITY,   8388608
.equ OUT_CAPACITY,    8388608
.equ SAVE_CAPACITY,   65536
.equ LINE_CAP,        1024
.equ MAX_LINES,       8192
.equ MAX_LOAD_BYTES,  EDIT_CAPACITY + (MAX_LINES * 2)
.equ CMD_CAPACITY,    4096
.equ FILE_CAPACITY,   4096
.equ TEMP_CAPACITY,   4096
.equ MSG_CAPACITY,    256
.equ PREFIX_WIDTH,    6
.equ MAX_SCREEN_ROWS, 512
.equ MAX_SCREEN_COLS, 1024
.equ ESC_TIMEOUT_MS,  25
.equ ESC_CAPACITY,    32

.macro RAW_SYSCALL
    syscall
.ifdef FREEBSD
    jnc .Lraw_syscall_ok\@
    neg rax
.Lraw_syscall_ok\@:
.endif
.endm

.section .rodata
hide_cursor_seq:      .ascii "\033[?25l"
.equ HIDE_CURSOR_LEN, . - hide_cursor_seq
show_cursor_seq:      .ascii "\033[?25h"
.equ SHOW_CURSOR_LEN, . - show_cursor_seq
cursor_block_seq:     .ascii "\033[2 q"
.equ CURSOR_BLOCK_LEN, . - cursor_block_seq
cursor_bar_seq:       .ascii "\033[6 q"
.equ CURSOR_BAR_LEN, . - cursor_bar_seq
enter_alternate_screen_seq: .ascii "\033[?1049h\033[2J\033[H\033[?25l"
.equ ENTER_ALTERNATE_SCREEN_LEN, . - enter_alternate_screen_seq
leave_alternate_screen_seq: .ascii "\033[?1049l\033[0m\033[2 q\033[?25h"
.equ LEAVE_ALTERNATE_SCREEN_LEN, . - leave_alternate_screen_seq
home_seq:             .ascii "\033[H"
.equ HOME_SEQ_LEN,    . - home_seq
clear_line_seq:       .ascii "\033[K"
.equ CLEAR_LINE_LEN,  . - clear_line_seq
reset_seq:            .ascii "\033[0m"
.equ RESET_SEQ_LEN,   . - reset_seq
reverse_seq:          .ascii "\033[7m"
.equ REVERSE_SEQ_LEN, . - reverse_seq

color_default_seq:    .ascii "\033[39m"
.equ COLOR_DEFAULT_LEN, . - color_default_seq
color_keyword_seq:    .ascii "\033[96m"
.equ COLOR_KEYWORD_LEN, . - color_keyword_seq
color_string_seq:     .ascii "\033[93m"
.equ COLOR_STRING_LEN, . - color_string_seq
color_number_seq:     .ascii "\033[95m"
.equ COLOR_NUMBER_LEN, . - color_number_seq
color_comment_seq:    .ascii "\033[90m"
.equ COLOR_COMMENT_LEN, . - color_comment_seq
color_gutter_seq:     .ascii "\033[38;5;244m"
.equ COLOR_GUTTER_LEN, . - color_gutter_seq
color_scroll_track_seq: .ascii "\033[38;5;238m"
.equ COLOR_SCROLL_TRACK_LEN, . - color_scroll_track_seq
color_scroll_thumb_seq: .ascii "\033[38;5;250m"
.equ COLOR_SCROLL_THUMB_LEN, . - color_scroll_thumb_seq

crlf:                 .byte 13, 10
.equ CRLF_LEN,        . - crlf
lf_char:              .byte 10
pipe_space:           .ascii "| "
.equ PIPE_SPACE_LEN,  . - pipe_space

msg_help:             .asciz "NORMAL  i insert  :w  :q  :q!"
msg_insert:           .asciz "-- INSERT --"
msg_saved:            .asciz "written"
msg_save_fail:        .asciz "write failed"
msg_new_file:         .asciz "new file"
msg_no_name:          .asciz "no file name"
msg_dirty_quit:       .asciz "unsaved changes, use :q! to quit"
msg_unknown_cmd:      .asciz "unknown command"
msg_buffer_full:      .asciz "buffer full"
msg_file_truncated:   .asciz "file truncated to editor limits"
msg_lossy_save:       .asciz "refusing to overwrite truncated input; use :w newname"
msg_mixed_newlines:   .asciz "mixed line endings; in-place save disabled, use :w newname"
msg_mixed_newlines_save: .asciz "refusing to overwrite mixed line endings; use :w newname"
msg_file_changed:     .asciz "file changed, replaced, or is a symlink"
msg_command_long:     .asciz "command too long"
msg_term_fail:        .asciz "failed to enter raw mode\n"
.equ MSG_TERM_FAIL_LEN, . - msg_term_fail - 1
msg_alloc_fail:       .asciz "failed to allocate memory\n"
.equ MSG_ALLOC_FAIL_LEN, . - msg_alloc_fail - 1
msg_signal_fail:      .asciz "failed to install signal handlers\n"
.equ MSG_SIGNAL_FAIL_LEN, . - msg_signal_fail - 1
msg_path_long:        .asciz "file path is too long\n"
.equ MSG_PATH_LONG_LEN, . - msg_path_long - 1
msg_open_fail:        .asciz "failed to open file\n"
.equ MSG_OPEN_FAIL_LEN, . - msg_open_fail - 1
msg_read_fail:        .asciz "failed to read file\n"
.equ MSG_READ_FAIL_LEN, . - msg_read_fail - 1
msg_file_type_fail:   .asciz "refusing to edit a non-regular file\n"
.equ MSG_FILE_TYPE_FAIL_LEN, . - msg_file_type_fail - 1

mode_normal_txt:      .asciz "NORMAL"
.equ MODE_NORMAL_LEN, . - mode_normal_txt - 1
mode_insert_txt:      .asciz "INSERT"
.equ MODE_INSERT_LEN, . - mode_insert_txt - 1
mode_command_txt:     .asciz "COMMAND"
.equ MODE_COMMAND_LEN, . - mode_command_txt - 1
no_name_txt:          .asciz "[No Name]"
.equ NO_NAME_LEN,     . - no_name_txt - 1
dirty_txt:            .asciz " [+]"
sep_txt:              .asciz " | "
ln_txt:               .asciz " Ln "
slash_txt:            .asciz "/"
temp_suffix:          .ascii ".a-vim.tmp."
.equ TEMP_SUFFIX_LEN, . - temp_suffix

.balign 16
space_block:          .fill 256, 1, 0x20

c_ext_1:              .asciz ".c"
c_ext_2:              .asciz ".h"
c_ext_3:              .asciz ".cpp"
c_ext_4:              .asciz ".hpp"
c_ext_5:              .asciz ".cc"
c_ext_6:              .asciz ".js"
c_ext_7:              .asciz ".ts"
c_ext_8:              .asciz ".java"
c_ext_9:              .asciz ".go"
c_ext_10:             .asciz ".rs"

asm_ext_1:            .asciz ".asm"
asm_ext_2:            .asciz ".s"
asm_ext_3:            .asciz ".S"

hash_ext_1:           .asciz ".py"
hash_ext_2:           .asciz ".sh"
hash_ext_3:           .asciz ".rb"
hash_ext_4:           .asciz ".pl"
hash_ext_5:           .asciz ".yaml"
hash_ext_6:           .asciz ".yml"
hash_ext_7:           .asciz ".toml"
hash_ext_8:           .asciz ".ini"
hash_ext_9:           .asciz ".conf"

asm_keywords:
    .asciz "mov"
    .asciz "lea"
    .asciz "call"
    .asciz "jmp"
    .asciz "cmp"
    .asciz "test"
    .asciz "push"
    .asciz "pop"
    .asciz "add"
    .asciz "sub"
    .asciz "xor"
    .asciz "and"
    .asciz "or"
    .asciz "ret"
    .asciz "syscall"
    .asciz "section"
    .asciz "global"
    .asciz "extern"
    .byte 0

c_keywords:
    .asciz "if"
    .asciz "else"
    .asciz "for"
    .asciz "while"
    .asciz "return"
    .asciz "struct"
    .asciz "typedef"
    .asciz "static"
    .asciz "const"
    .asciz "int"
    .asciz "char"
    .asciz "void"
    .asciz "long"
    .asciz "short"
    .asciz "unsigned"
    .asciz "signed"
    .asciz "switch"
    .asciz "case"
    .asciz "break"
    .asciz "continue"
    .asciz "class"
    .asciz "function"
    .asciz "let"
    .asciz "var"
    .byte 0

hash_keywords:
    .asciz "def"
    .asciz "class"
    .asciz "if"
    .asciz "elif"
    .asciz "else"
    .asciz "for"
    .asciz "while"
    .asciz "return"
    .asciz "import"
    .asciz "from"
    .asciz "try"
    .asciz "except"
    .asciz "with"
    .asciz "lambda"
    .asciz "pass"
    .byte 0

.section .bss
.lcomm orig_termios,    TERMIOS_SIZE
.lcomm raw_termios,     TERMIOS_SIZE
.lcomm winsize,         8
.lcomm stdin_pollfd,    8
.lcomm input_buf,       8
.lcomm num_buf,         32
.lcomm file_read_buf,   4096
.lcomm file_stat,       STAT_BUFFER_SIZE
.lcomm path_stat,       STAT_BUFFER_SIZE
.lcomm sigaction_buf,   32
.lcomm escape_buf,      ESC_CAPACITY
.lcomm temp_path,       TEMP_CAPACITY
.lcomm save_buf,        SAVE_CAPACITY
.lcomm save_buf_len,    8
.lcomm save_fd,         8

.lcomm edit_ptr,        8
.lcomm render_ptr,      8
.lcomm render_len,      8

.lcomm cursor_x,        4
.lcomm cursor_y,        4
.lcomm rowoff,          4
.lcomm coloff,          4
.lcomm screen_rows,     4
.lcomm screen_cols,     4
.lcomm text_rows,       4
.lcomm view_cols,       4
.lcomm total_lines_cache, 4

.lcomm editor_mode,     4
.lcomm syntax_mode,     4
.lcomm dirty_flag,      4
.lcomm quit_flag,       4
.lcomm raw_enabled,     4
.lcomm screen_active,   4
.lcomm current_color,   4
.lcomm pending_key,     4
.lcomm have_pending,    4
.lcomm insert_char_tmp, 4
.lcomm line_count,      4
.lcomm line_lengths,    MAX_LINES * 4
.lcomm load_truncated,  4
.lcomm load_input_bytes, 8
.lcomm newline_mode,    4
.lcomm newline_mixed,   4
.lcomm loaded_exists,   4
.lcomm loaded_dev,      8
.lcomm loaded_ino,      8
.lcomm loaded_size,     8
.lcomm loaded_mtime_sec, 8
.lcomm loaded_mtime_nsec, 8
.lcomm target_exists,   4
.lcomm target_mode,     4
.lcomm temp_created,    4
.lcomm save_as_flag,    4
.lcomm save_distinct_flag, 4

.lcomm command_len,     4
.lcomm command_overflow, 4
.lcomm command_buf,     CMD_CAPACITY
.lcomm filename_len,    4
.lcomm filename_buf,    FILE_CAPACITY
.lcomm save_as_old_filename_len, 4
.lcomm save_as_old_filename_buf, FILE_CAPACITY
.lcomm message_len,     4
.lcomm message_buf,     MSG_CAPACITY
.lcomm termination_signal, 4
.lcomm exit_status,     4

.section .text
.global _start

_start:
.ifdef FREEBSD
    mov rbx, rdi
.endif
    call alloc_buffers
    call init_empty_buffer
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    mov dword ptr [rip + current_color], COLOR_DEFAULT

.ifndef FREEBSD
    mov rbx, rsp
.endif
    mov rax, qword ptr [rbx]
    cmp rax, 2
    jb .after_args
    mov rdi, qword ptr [rbx + 16]
    call copy_c_string_to_filename
    test eax, eax
    jne fatal_path_long
    call detect_syntax
    call load_file

.after_args:
    cmp dword ptr [rip + message_len], 0
    jne .have_msg
    lea rdi, [rip + msg_help]
    call set_message_z

.have_msg:
    call install_signal_handlers
    test eax, eax
    jne fatal_signal
    call enable_raw_mode
    test eax, eax
    jne fatal_term
    cmp dword ptr [rip + termination_signal], 0
    jne .leave_main_loop
    call enter_alternate_screen
    test eax, eax
    je .main_loop
    mov dword ptr [rip + exit_status], 1
    jmp .leave_main_loop

.main_loop:
    cmp dword ptr [rip + termination_signal], 0
    jne .leave_main_loop
    call refresh_screen
    cmp dword ptr [rip + quit_flag], 0
    jne .leave_main_loop
    call process_keypress
    cmp dword ptr [rip + quit_flag], 0
    je .main_loop
    jmp .leave_main_loop

.leave_main_loop:
    mov eax, dword ptr [rip + termination_signal]
    test eax, eax
    jz .exit_status_ready
    add eax, 128
    mov dword ptr [rip + exit_status], eax
.exit_status_ready:
    call cleanup_terminal
    mov eax, SYS_exit
    mov edi, dword ptr [rip + exit_status]
    RAW_SYSCALL

fatal_alloc:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_alloc_fail]
    mov edx, MSG_ALLOC_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_signal:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_signal_fail]
    mov edx, MSG_SIGNAL_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_path_long:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_path_long]
    mov edx, MSG_PATH_LONG_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_open:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_open_fail]
    mov edx, MSG_OPEN_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_read:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_read_fail]
    mov edx, MSG_READ_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_file_type:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_file_type_fail]
    mov edx, MSG_FILE_TYPE_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

fatal_term:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_term_fail]
    mov edx, MSG_TERM_FAIL_LEN
    RAW_SYSCALL
    mov eax, SYS_exit
    mov edi, 1
    RAW_SYSCALL

alloc_buffers:
    mov eax, SYS_mmap
    xor edi, edi
    mov esi, EDIT_CAPACITY
    mov edx, PROT_READ | PROT_WRITE
    mov r10d, MAP_PRIVATE | MAP_ANON
    mov r8, -1
    xor r9d, r9d
    RAW_SYSCALL
    test rax, rax
    js fatal_alloc
    mov qword ptr [rip + edit_ptr], rax

    mov eax, SYS_mmap
    xor edi, edi
    mov esi, OUT_CAPACITY
    mov edx, PROT_READ | PROT_WRITE
    mov r10d, MAP_PRIVATE | MAP_ANON
    mov r8, -1
    xor r9d, r9d
    RAW_SYSCALL
    test rax, rax
    js fatal_alloc
    mov qword ptr [rip + render_ptr], rax
    ret

install_signal_handlers:
    lea rax, [rip + termination_handler]
    mov qword ptr [rip + sigaction_buf], rax
.ifdef FREEBSD
    mov qword ptr [rip + sigaction_buf + 8], 0
    mov qword ptr [rip + sigaction_buf + 16], 0
    mov qword ptr [rip + sigaction_buf + 24], 0
.else
    mov qword ptr [rip + sigaction_buf + 8], SA_RESTORER
    lea rax, [rip + signal_restorer]
    mov qword ptr [rip + sigaction_buf + 16], rax
    mov qword ptr [rip + sigaction_buf + 24], 0
.endif

    mov edi, SIGHUP
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail
    mov edi, SIGINT
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail
    mov edi, SIGQUIT
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail
    mov edi, SIGTERM
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail

    mov qword ptr [rip + sigaction_buf], SIG_IGN
    mov qword ptr [rip + sigaction_buf + 8], 0
    mov qword ptr [rip + sigaction_buf + 16], 0
    mov qword ptr [rip + sigaction_buf + 24], 0
    mov edi, SIGPIPE
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail
    mov edi, SIGTSTP
    call install_one_signal
    test eax, eax
    jne .Lsignal_install_fail
    xor eax, eax
    ret

.Lsignal_install_fail:
    mov eax, 1
    ret

install_one_signal:
.Linstall_signal_retry:
    mov eax, SYS_sigaction
    lea rsi, [rip + sigaction_buf]
    xor edx, edx
.ifndef FREEBSD
    mov r10d, 8
.endif
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Linstall_signal_retry
    test rax, rax
    js .Linstall_signal_error
    xor eax, eax
    ret
.Linstall_signal_error:
    mov eax, 1
    ret

termination_handler:
    cmp dword ptr [rip + termination_signal], 0
    jne .Ltermination_handler_done
    mov dword ptr [rip + termination_signal], edi
.Ltermination_handler_done:
    ret

.ifndef FREEBSD
signal_restorer:
    mov eax, SYS_rt_sigreturn
    RAW_SYSCALL
    ud2
.endif

enable_raw_mode:
.Lenable_get_retry:
    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCGETS
    lea rdx, [rip + orig_termios]
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Lenable_get_retry
    test rax, rax
    js .Lenable_raw_fail

    lea rsi, [rip + orig_termios]
    lea rdi, [rip + raw_termios]
    mov ecx, TERMIOS_SIZE
    cld
    rep movsb

    mov eax, dword ptr [rip + raw_termios + TERMIOS_IFLAG]
    and eax, ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON)
    mov dword ptr [rip + raw_termios + TERMIOS_IFLAG], eax

    mov eax, dword ptr [rip + raw_termios + TERMIOS_OFLAG]
    and eax, ~OPOST
    mov dword ptr [rip + raw_termios + TERMIOS_OFLAG], eax

    mov eax, dword ptr [rip + raw_termios + TERMIOS_CFLAG]
    or eax, CS8
    mov dword ptr [rip + raw_termios + TERMIOS_CFLAG], eax

    mov eax, dword ptr [rip + raw_termios + TERMIOS_LFLAG]
    and eax, ~(ECHO | ICANON | IEXTEN)
    mov dword ptr [rip + raw_termios + TERMIOS_LFLAG], eax

    mov byte ptr [rip + raw_termios + TERMIOS_VMIN], 1
    mov byte ptr [rip + raw_termios + TERMIOS_VTIME], 0

.Lenable_set_retry:
    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCSETS
    lea rdx, [rip + raw_termios]
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Lenable_set_retry
    test rax, rax
    js .Lenable_raw_fail
    mov dword ptr [rip + raw_enabled], 1
    xor eax, eax
    ret

.Lenable_raw_fail:
    mov eax, 1
    ret

disable_raw_mode:
    cmp dword ptr [rip + raw_enabled], 1
    jne .Ldisable_raw_done
.Ldisable_raw_retry:
    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCSETS
    lea rdx, [rip + orig_termios]
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Ldisable_raw_retry
    test rax, rax
    js .Ldisable_raw_fail
    mov dword ptr [rip + raw_enabled], 0
.Ldisable_raw_done:
    xor eax, eax
    ret
.Ldisable_raw_fail:
    mov eax, 1
    ret

enter_alternate_screen:
    cmp dword ptr [rip + screen_active], 0
    jne .Lenter_alternate_done
    mov dword ptr [rip + screen_active], 1
    mov edi, STDOUT_FD
    lea rsi, [rip + enter_alternate_screen_seq]
    mov edx, ENTER_ALTERNATE_SCREEN_LEN
    call write_all
    ret
.Lenter_alternate_done:
    xor eax, eax
    ret

cleanup_terminal:
    call disable_raw_mode
    cmp dword ptr [rip + screen_active], 0
    je .Lcleanup_terminal_done
    mov dword ptr [rip + screen_active], 0
    mov edi, STDOUT_FD
    lea rsi, [rip + leave_alternate_screen_seq]
    mov edx, LEAVE_ALTERNATE_SCREEN_LEN
    call write_all
.Lcleanup_terminal_done:
    ret

get_window_size:
    mov eax, SYS_ioctl
    mov edi, STDOUT_FD
    mov esi, TIOCGWINSZ
    lea rdx, [rip + winsize]
    RAW_SYSCALL
    test rax, rax
    js .fallback
    movzx eax, word ptr [rip + winsize + WS_ROW]
    test eax, eax
    jz .fallback
    cmp eax, MAX_SCREEN_ROWS
    jbe .rows_bounded
    mov eax, MAX_SCREEN_ROWS
.rows_bounded:
    mov dword ptr [rip + screen_rows], eax
    movzx eax, word ptr [rip + winsize + WS_COL]
    test eax, eax
    jz .fallback
    cmp eax, MAX_SCREEN_COLS
    jbe .cols_bounded
    mov eax, MAX_SCREEN_COLS
.cols_bounded:
    mov dword ptr [rip + screen_cols], eax
    jmp .normalize

.fallback:
    mov dword ptr [rip + screen_rows], 24
    mov dword ptr [rip + screen_cols], 80

.normalize:
    mov eax, dword ptr [rip + screen_rows]
    cmp eax, 3
    jae .rows_ok
    mov dword ptr [rip + screen_rows], 3
.rows_ok:
    mov eax, dword ptr [rip + screen_rows]
    sub eax, 2
    mov dword ptr [rip + text_rows], eax
    mov eax, dword ptr [rip + screen_cols]
    sub eax, PREFIX_WIDTH + 1
    cmp eax, 1
    jge .cols_ok
    mov eax, 1
.cols_ok:
    mov dword ptr [rip + view_cols], eax
    ret

refresh_screen:
    call get_window_size
    call total_lines
    mov dword ptr [rip + total_lines_cache], eax
    call scroll_editor
    call ab_reset

    lea rdi, [rip + hide_cursor_seq]
    mov esi, HIDE_CURSOR_LEN
    call ab_append_ptr_len
    lea rdi, [rip + home_seq]
    mov esi, HOME_SEQ_LEN
    call ab_append_ptr_len

    xor r12d, r12d
.row_loop:
    mov eax, dword ptr [rip + text_rows]
    cmp r12d, eax
    jae .after_rows

    mov eax, dword ptr [rip + rowoff]
    add eax, r12d
    cmp eax, dword ptr [rip + total_lines_cache]
    jae .draw_empty

    mov edi, eax
    inc edi
    call append_line_prefix

    mov eax, dword ptr [rip + rowoff]
    add eax, r12d
    mov edi, eax
    call render_line
    mov edi, COLOR_DEFAULT
    call ab_set_color
    mov eax, dword ptr [rip + rowoff]
    add eax, r12d
    mov edi, eax
    call visible_width_for_line
    mov edi, eax
    call pad_line_to_view
    mov edi, r12d
    call append_scrollbar
    jmp .row_done

.draw_empty:
    call append_empty_prefix
    mov edi, COLOR_GUTTER
    call ab_set_color
    mov al, '~'
    call ab_append_char
    mov edi, COLOR_DEFAULT
    call ab_set_color
    mov edi, 1
    call pad_line_to_view
    mov edi, r12d
    call append_scrollbar

.row_done:
    mov edi, COLOR_DEFAULT
    call ab_set_color
    lea rdi, [rip + clear_line_seq]
    mov esi, CLEAR_LINE_LEN
    call ab_append_ptr_len
    lea rdi, [rip + crlf]
    mov esi, CRLF_LEN
    call ab_append_ptr_len
    inc r12d
    jmp .row_loop

.after_rows:
    call draw_status_bar
    call draw_message_bar
    call append_cursor_position
    call append_cursor_shape
    lea rdi, [rip + show_cursor_seq]
    mov esi, SHOW_CURSOR_LEN
    call ab_append_ptr_len

    mov eax, SYS_write
    mov edi, STDOUT_FD
    mov rsi, qword ptr [rip + render_ptr]
    mov rdx, qword ptr [rip + render_len]
    call write_all
    test eax, eax
    je .Lrefresh_done
    mov dword ptr [rip + quit_flag], 1
    mov dword ptr [rip + exit_status], 1
.Lrefresh_done:
    ret

scroll_editor:
    call clamp_cursor

    mov eax, dword ptr [rip + cursor_y]
    cmp eax, dword ptr [rip + rowoff]
    jge .check_bottom
    mov dword ptr [rip + rowoff], eax

.check_bottom:
    mov eax, dword ptr [rip + cursor_y]
    mov ecx, dword ptr [rip + rowoff]
    add ecx, dword ptr [rip + text_rows]
    cmp eax, ecx
    jl .check_left
    mov ecx, dword ptr [rip + text_rows]
    dec ecx
    mov eax, dword ptr [rip + cursor_y]
    sub eax, ecx
    mov dword ptr [rip + rowoff], eax

.check_left:
    mov eax, dword ptr [rip + cursor_x]
    cmp eax, dword ptr [rip + coloff]
    jge .check_right
    mov dword ptr [rip + coloff], eax

.check_right:
    mov eax, dword ptr [rip + cursor_x]
    mov ecx, dword ptr [rip + coloff]
    add ecx, dword ptr [rip + view_cols]
    cmp eax, ecx
    jl .Lscroll_done
    mov ecx, dword ptr [rip + view_cols]
    dec ecx
    mov eax, dword ptr [rip + cursor_x]
    sub eax, ecx
    mov dword ptr [rip + coloff], eax
.Lscroll_done:
    ret

process_keypress:
    call read_key
    mov r12d, eax

    cmp dword ptr [rip + editor_mode], MODE_COMMAND
    je .command
    cmp dword ptr [rip + editor_mode], MODE_INSERT
    je .insert
    jmp .normal

.normal:
    cmp r12d, 'i'
    je .enter_insert
    cmp r12d, ':'
    je .enter_command
    cmp r12d, 'h'
    je .left
    cmp r12d, 'j'
    je .down
    cmp r12d, 'k'
    je .up
    cmp r12d, 'l'
    je .right
    cmp r12d, 'x'
    je .del_at
    cmp r12d, KEY_ARROW_LEFT
    je .left
    cmp r12d, KEY_ARROW_RIGHT
    je .right
    cmp r12d, KEY_ARROW_UP
    je .up
    cmp r12d, KEY_ARROW_DOWN
    je .down
    cmp r12d, KEY_HOME
    je .home
    cmp r12d, KEY_END
    je .end
    cmp r12d, KEY_PAGEUP
    je .page_up
    cmp r12d, KEY_PAGEDOWN
    je .page_down
    ret

.enter_insert:
    mov dword ptr [rip + editor_mode], MODE_INSERT
    lea rdi, [rip + msg_insert]
    call set_message_z
    ret

.enter_command:
    mov dword ptr [rip + editor_mode], MODE_COMMAND
    mov dword ptr [rip + command_len], 0
    mov dword ptr [rip + command_overflow], 0
    ret

.left:
    call move_left
    ret
.right:
    call move_right
    ret
.up:
    call move_up
    ret
.down:
    call move_down
    ret
.home:
    mov dword ptr [rip + cursor_x], 0
    ret
.end:
    mov edi, dword ptr [rip + cursor_y]
    call line_length
    test eax, eax
    jz 1f
    dec eax
1:
    mov dword ptr [rip + cursor_x], eax
    ret
.page_up:
    mov ecx, dword ptr [rip + text_rows]
1:
    test ecx, ecx
    jz 2f
    push rcx
    call move_up
    pop rcx
    dec ecx
    jmp 1b
2:
    ret
.page_down:
    mov ecx, dword ptr [rip + text_rows]
3:
    test ecx, ecx
    jz 4f
    push rcx
    call move_down
    pop rcx
    dec ecx
    jmp 3b
4:
    ret
.del_at:
    call delete_at_cursor
    ret

.insert:
    cmp r12d, KEY_ESC
    je .leave_insert
    cmp r12d, KEY_BACKSPACE
    je .backspace
    cmp r12d, 8
    je .backspace
    cmp r12d, KEY_DELETE
    je .delete_forward
    cmp r12d, KEY_ENTER
    je .newline
    cmp r12d, 10
    je .newline
    cmp r12d, 9
    je .tab_insert
    cmp r12d, KEY_ARROW_LEFT
    je .left
    cmp r12d, KEY_ARROW_RIGHT
    je .right
    cmp r12d, KEY_ARROW_UP
    je .up
    cmp r12d, KEY_ARROW_DOWN
    je .down
    cmp r12d, 32
    jb .ignore
    cmp r12d, 126
    ja .ignore
    mov eax, r12d
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
.ignore:
    ret

.leave_insert:
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    call clamp_cursor_x
    lea rdi, [rip + msg_help]
    call set_message_z
    ret
.backspace:
    call backspace_byte
    ret
.delete_forward:
    call delete_at_cursor
    ret
.newline:
    mov eax, 10
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
    ret
.tab_insert:
    mov eax, ' '
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
    mov eax, ' '
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
    mov eax, ' '
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
    mov eax, ' '
    mov dword ptr [rip + insert_char_tmp], eax
    call insert_byte
    ret

.command:
    cmp r12d, KEY_ESC
    je .cancel_command
    cmp r12d, KEY_BACKSPACE
    je .cmd_backspace
    cmp r12d, 8
    je .cmd_backspace
    cmp r12d, KEY_DELETE
    je .cmd_backspace
    cmp r12d, KEY_ENTER
    je .run_command
    cmp r12d, 10
    je .run_command
    cmp r12d, 32
    jb .cmd_done
    cmp r12d, 126
    ja .cmd_done
    mov ecx, dword ptr [rip + command_len]
    cmp ecx, CMD_CAPACITY - 1
    jae .cmd_overflow
    lea rdx, [rip + command_buf]
    mov byte ptr [rdx + rcx], r12b
    inc ecx
    mov dword ptr [rip + command_len], ecx
.cmd_done:
    ret

.cmd_overflow:
    cmp dword ptr [rip + command_overflow], -1
    je .cmd_done
    inc dword ptr [rip + command_overflow]
    ret

.cancel_command:
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    mov dword ptr [rip + command_len], 0
    mov dword ptr [rip + command_overflow], 0
    lea rdi, [rip + msg_help]
    call set_message_z
    ret

.cmd_backspace:
    mov eax, dword ptr [rip + command_overflow]
    test eax, eax
    jz .cmd_backspace_buffered
    dec eax
    mov dword ptr [rip + command_overflow], eax
    ret
.cmd_backspace_buffered:
    mov ecx, dword ptr [rip + command_len]
    test ecx, ecx
    jz .cmd_done
    dec ecx
    mov dword ptr [rip + command_len], ecx
    ret

.run_command:
    call execute_command
    ret

execute_command:
    cmp dword ptr [rip + command_overflow], 0
    je .command_length_ok
    lea rdi, [rip + msg_command_long]
    call set_message_z
    jmp .finish
.command_length_ok:
    mov eax, dword ptr [rip + command_len]
    test eax, eax
    jz .finish

    cmp eax, 1
    jne .check_qbang
    cmp byte ptr [rip + command_buf], 'q'
    jne .check_w
    cmp dword ptr [rip + dirty_flag], 0
    je .set_quit
    lea rdi, [rip + msg_dirty_quit]
    call set_message_z
    jmp .finish

.check_qbang:
    cmp eax, 2
    jne .check_w
    cmp byte ptr [rip + command_buf], 'q'
    jne .check_w
    cmp byte ptr [rip + command_buf + 1], '!'
    jne .check_w
    jmp .set_quit

.check_w:
    cmp byte ptr [rip + command_buf], 'w'
    jne .unknown
    cmp eax, 1
    je .save_only
    cmp eax, 2
    jne .check_w_rest
    cmp byte ptr [rip + command_buf + 1], 'q'
    je .save_quit

.check_w_rest:
    cmp byte ptr [rip + command_buf + 1], ' '
    je .save_with_name
    cmp eax, 3
    jb .unknown
    cmp byte ptr [rip + command_buf + 1], 'q'
    jne .unknown
    cmp byte ptr [rip + command_buf + 2], ' '
    jne .unknown
    mov edi, 3
    call save_from_command_arg
    test eax, eax
    jne .finish
    jmp .set_quit

.save_only:
    call save_file
    jmp .finish

.save_quit:
    call save_file
    test eax, eax
    jne .finish
    jmp .set_quit

.save_with_name:
    mov edi, 2
    call save_from_command_arg
    jmp .finish

.unknown:
    lea rdi, [rip + msg_unknown_cmd]
    call set_message_z
    jmp .finish

.set_quit:
    mov dword ptr [rip + quit_flag], 1

.finish:
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    mov dword ptr [rip + command_len], 0
    mov dword ptr [rip + command_overflow], 0
    ret

save_from_command_arg:
    mov ecx, dword ptr [rip + command_len]
    cmp edi, ecx
    jae .no_name

.skip_spaces:
    cmp edi, ecx
    jae .no_name
    lea rdx, [rip + command_buf]
    mov al, byte ptr [rdx + rdi]
    cmp al, ' '
    jne .copy
    inc edi
    jmp .skip_spaces

.copy:
    push rdi
    push rcx
    mov eax, dword ptr [rip + filename_len]
    mov dword ptr [rip + save_as_old_filename_len], eax
    lea rsi, [rip + filename_buf]
    lea rdi, [rip + save_as_old_filename_buf]
    mov ecx, eax
    inc ecx
    cld
    rep movsb
    pop rcx
    pop rdi
    xor esi, esi
.Lsave_as_copy_loop:
    cmp edi, ecx
    jae .Lsave_as_copy_done
    cmp esi, FILE_CAPACITY - 1
    jae .Lsave_as_copy_done
    lea rdx, [rip + command_buf]
    mov al, byte ptr [rdx + rdi]
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rsi], al
    inc esi
    inc edi
    jmp .Lsave_as_copy_loop
.Lsave_as_copy_done:
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rsi], 0
    mov dword ptr [rip + filename_len], esi
    mov dword ptr [rip + save_as_flag], 0
    cmp esi, dword ptr [rip + save_as_old_filename_len]
    jne .Lsave_as_distinct
    lea rdx, [rip + filename_buf]
    lea r8, [rip + save_as_old_filename_buf]
    xor ecx, ecx
.Lsave_as_compare:
    cmp ecx, esi
    jae .Lsave_as_candidate_ready
    mov al, byte ptr [rdx + rcx]
    cmp al, byte ptr [r8 + rcx]
    jne .Lsave_as_distinct
    inc ecx
    jmp .Lsave_as_compare
.Lsave_as_distinct:
    mov dword ptr [rip + save_as_flag], 1
.Lsave_as_candidate_ready:
    call detect_syntax
    call save_file
    push rax
    test eax, eax
    je .Lsave_as_done
    lea rsi, [rip + save_as_old_filename_buf]
    lea rdi, [rip + filename_buf]
    mov ecx, dword ptr [rip + save_as_old_filename_len]
    inc ecx
    cld
    rep movsb
    mov eax, dword ptr [rip + save_as_old_filename_len]
    mov dword ptr [rip + filename_len], eax
    call detect_syntax
.Lsave_as_done:
    mov dword ptr [rip + save_as_flag], 0
    mov dword ptr [rip + save_distinct_flag], 0
    pop rax
    ret

.no_name:
    lea rdi, [rip + msg_no_name]
    call set_message_z
    mov eax, 1
    ret

save_file:
    cmp dword ptr [rip + filename_len], 0
    jne .have_name
    lea rdi, [rip + msg_no_name]
    call set_message_z
    mov eax, 1
    ret

.have_name:
    call prepare_save_target
    test eax, eax
    jne .Lsave_return_fail
    cmp dword ptr [rip + load_truncated], 0
    je .Lsave_check_mixed_newlines
    cmp dword ptr [rip + save_distinct_flag], 0
    jne .Lsave_check_mixed_newlines
    lea rdi, [rip + msg_lossy_save]
    call set_message_z
    mov eax, 1
    ret

.Lsave_check_mixed_newlines:
    cmp dword ptr [rip + newline_mixed], 0
    je .lossless_input
    cmp dword ptr [rip + save_distinct_flag], 0
    jne .lossless_input
    lea rdi, [rip + msg_mixed_newlines_save]
    call set_message_z
    mov eax, 1
    ret

.lossless_input:
    call build_temp_path
    test eax, eax
    jne .Lsave_fail

    mov qword ptr [rip + save_fd], -1
    mov dword ptr [rip + temp_created], 0
.Lsave_open_temp:
    mov eax, SYS_open
    lea rdi, [rip + temp_path]
    mov esi, O_WRONLY | O_CREAT | O_EXCL | O_CLOEXEC | O_NOFOLLOW
    mov edx, 438
    cmp dword ptr [rip + target_exists], 0
    je .Lsave_do_open
    mov edx, 384
.Lsave_do_open:
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_open_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_open_temp
    jmp .Lsave_fail
.Lsave_open_result:
    test rax, rax
    js .Lsave_fail
    mov r12, rax
    mov qword ptr [rip + save_fd], rax
    mov dword ptr [rip + temp_created], 1

    cmp dword ptr [rip + target_exists], 0
    je .Lsave_write_buffer
.Lsave_chmod_retry:
    mov eax, SYS_fchmod
    mov rdi, r12
    mov esi, dword ptr [rip + target_mode]
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_chmod_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_chmod_retry
    jmp .Lsave_cleanup_fail
.Lsave_chmod_result:
    test rax, rax
    js .Lsave_cleanup_fail

.Lsave_write_buffer:
    mov qword ptr [rip + save_buf_len], 0
    xor r13d, r13d

.line_loop:
    mov eax, dword ptr [rip + line_count]
    cmp r13d, eax
    jae .close_ok

    mov edi, r13d
    call get_line_ptr
    mov rdi, rax
    lea rdx, [rip + line_lengths]
    mov esi, dword ptr [rdx + r13*4]
    call save_buffer_append
    test eax, eax
    jne .Lsave_cleanup_fail

    mov eax, dword ptr [rip + line_count]
    dec eax
    cmp r13d, eax
    je .next_line

    cmp dword ptr [rip + newline_mode], NEWLINE_CRLF
    jne .Lsave_append_lf
    lea rdi, [rip + crlf]
    mov esi, CRLF_LEN
    call save_buffer_append
    jmp .Lsave_newline_result
.Lsave_append_lf:
    lea rdi, [rip + lf_char]
    mov esi, 1
    call save_buffer_append
.Lsave_newline_result:
    test eax, eax
    jne .Lsave_cleanup_fail

.next_line:
    inc r13d
    jmp .line_loop

.close_ok:
    call save_buffer_flush
    test eax, eax
    jne .Lsave_cleanup_fail

.Lsave_sync_retry:
    mov eax, SYS_fsync
    mov rdi, r12
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_sync_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_sync_retry
    jmp .Lsave_cleanup_fail
.Lsave_sync_result:
    test rax, rax
    js .Lsave_cleanup_fail

.Lsave_stat_retry:
    mov eax, SYS_fstat
    mov rdi, r12
    lea rsi, [rip + file_stat]
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_stat_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_stat_retry
    jmp .Lsave_cleanup_fail
.Lsave_stat_result:
    test rax, rax
    js .Lsave_cleanup_fail

    mov eax, SYS_close
    mov rdi, r12
    RAW_SYSCALL
    mov qword ptr [rip + save_fd], -1
    test rax, rax
    js .Lsave_unlink_fail

    cmp dword ptr [rip + target_exists], 0
    je .Lsave_rename_new
    mov eax, SYS_rename
    lea rdi, [rip + temp_path]
    lea rsi, [rip + filename_buf]
    RAW_SYSCALL
    jmp .Lsave_rename_result
.Lsave_rename_new:
.ifdef FREEBSD
.Lsave_link_retry:
    mov eax, SYS_link
    lea rdi, [rip + temp_path]
    lea rsi, [rip + filename_buf]
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_link_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_link_retry
    jmp .Lsave_unlink_fail
.Lsave_link_result:
    test rax, rax
    js .Lsave_unlink_fail
.Lsave_unlink_published_retry:
    mov eax, SYS_unlink
    lea rdi, [rip + temp_path]
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lsave_published
    cmp dword ptr [rip + termination_signal], 0
    je .Lsave_unlink_published_retry
    jmp .Lsave_published
.else
    mov eax, SYS_renameat2
    mov edi, AT_FDCWD
    lea rsi, [rip + temp_path]
    mov edx, AT_FDCWD
    lea r10, [rip + filename_buf]
    mov r8d, RENAME_NOREPLACE
    RAW_SYSCALL
.endif
.Lsave_rename_result:
    test rax, rax
    js .Lsave_unlink_fail
.Lsave_published:
    mov dword ptr [rip + temp_created], 0

    mov rax, qword ptr [rip + file_stat + STAT_ST_DEV]
    mov qword ptr [rip + loaded_dev], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_INO]
    mov qword ptr [rip + loaded_ino], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_SIZE]
    mov qword ptr [rip + loaded_size], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_MTIME_SEC]
    mov qword ptr [rip + loaded_mtime_sec], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_MTIME_NSEC]
    mov qword ptr [rip + loaded_mtime_nsec], rax
    mov dword ptr [rip + loaded_exists], 1
    mov dword ptr [rip + dirty_flag], 0
    mov dword ptr [rip + load_truncated], 0
    mov dword ptr [rip + newline_mixed], 0
    lea rdi, [rip + msg_saved]
    call set_message_z
    xor eax, eax
    ret

.Lsave_cleanup_fail:
    mov rdi, qword ptr [rip + save_fd]
    cmp rdi, 0
    jl .Lsave_unlink_fail
    mov eax, SYS_close
    RAW_SYSCALL
    mov qword ptr [rip + save_fd], -1
.Lsave_unlink_fail:
    cmp dword ptr [rip + temp_created], 0
    je .Lsave_fail
    mov eax, SYS_unlink
    lea rdi, [rip + temp_path]
    RAW_SYSCALL
    mov dword ptr [rip + temp_created], 0
.Lsave_fail:
    lea rdi, [rip + msg_save_fail]
    call set_message_z
.Lsave_return_fail:
    mov eax, 1
    ret

prepare_save_target:
    mov dword ptr [rip + target_exists], 0
    mov dword ptr [rip + save_distinct_flag], 0
.Lprepare_open_retry:
    mov eax, SYS_open
    lea rdi, [rip + filename_buf]
    mov esi, O_RDONLY | O_CLOEXEC | O_NOFOLLOW
    xor edx, edx
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lprepare_open_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lprepare_open_retry
    jmp .Lprepare_changed
.Lprepare_open_result:
    test rax, rax
    jns .Lprepare_opened
    cmp eax, -ENOENT
    jne .Lprepare_changed
    cmp dword ptr [rip + save_as_flag], 0
    je .Lprepare_missing_current
    mov dword ptr [rip + save_distinct_flag], 1
    jmp .Lprepare_ok
.Lprepare_missing_current:
    cmp dword ptr [rip + loaded_exists], 0
    jne .Lprepare_changed
    jmp .Lprepare_ok

.Lprepare_opened:
    mov r12, rax
.Lprepare_stat_retry:
    mov eax, SYS_fstat
    mov rdi, r12
    lea rsi, [rip + path_stat]
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lprepare_stat_result
    cmp dword ptr [rip + termination_signal], 0
    je .Lprepare_stat_retry
.Lprepare_stat_result:
    mov r13, rax
    mov eax, SYS_close
    mov rdi, r12
    RAW_SYSCALL
    test r13, r13
    js .Lprepare_changed

    mov eax, dword ptr [rip + path_stat + STAT_ST_MODE]
    mov ecx, eax
    and eax, S_IFMT
    cmp eax, S_IFREG
    jne .Lprepare_changed
    and ecx, 0777
    mov dword ptr [rip + target_mode], ecx
    mov dword ptr [rip + target_exists], 1

    cmp dword ptr [rip + loaded_exists], 1
    jne .Lprepare_no_loaded_identity
    mov rax, qword ptr [rip + path_stat + STAT_ST_DEV]
    cmp rax, qword ptr [rip + loaded_dev]
    jne .Lprepare_other_identity
    mov rax, qword ptr [rip + path_stat + STAT_ST_INO]
    cmp rax, qword ptr [rip + loaded_ino]
    jne .Lprepare_other_identity
    mov rax, qword ptr [rip + path_stat + STAT_ST_SIZE]
    cmp rax, qword ptr [rip + loaded_size]
    jne .Lprepare_changed
    mov rax, qword ptr [rip + path_stat + STAT_ST_MTIME_SEC]
    cmp rax, qword ptr [rip + loaded_mtime_sec]
    jne .Lprepare_changed
    mov rax, qword ptr [rip + path_stat + STAT_ST_MTIME_NSEC]
    cmp rax, qword ptr [rip + loaded_mtime_nsec]
    jne .Lprepare_changed
    jmp .Lprepare_ok

.Lprepare_other_identity:
    cmp dword ptr [rip + save_as_flag], 0
    je .Lprepare_changed
    mov dword ptr [rip + save_distinct_flag], 1
    jmp .Lprepare_ok

.Lprepare_no_loaded_identity:
    cmp dword ptr [rip + save_as_flag], 0
    je .Lprepare_changed
    mov dword ptr [rip + save_distinct_flag], 1
.Lprepare_ok:
    xor eax, eax
    ret

.Lprepare_changed:
    lea rdi, [rip + msg_file_changed]
    call set_message_z
    mov eax, 1
    ret

build_temp_path:
    mov ecx, dword ptr [rip + filename_len]
    xor edx, edx
    xor r12d, r12d
.Ltemp_find_slash:
    cmp edx, ecx
    jae .Ltemp_slash_done
    lea rax, [rip + filename_buf]
    cmp byte ptr [rax + rdx], '/'
    jne .Ltemp_next_char
    lea r12d, [edx + 1]
.Ltemp_next_char:
    inc edx
    jmp .Ltemp_find_slash

.Ltemp_slash_done:
    mov eax, r12d
    add eax, TEMP_SUFFIX_LEN + 11
    cmp eax, TEMP_CAPACITY
    ja .Ltemp_path_fail

    lea rdi, [rip + temp_path]
    lea rsi, [rip + filename_buf]
    mov ecx, r12d
    cld
    rep movsb
    lea rdi, [rip + temp_path]
    add rdi, r12
    lea rsi, [rip + temp_suffix]
    mov ecx, TEMP_SUFFIX_LEN
    cld
    rep movsb
    add r12d, TEMP_SUFFIX_LEN

    mov eax, SYS_getpid
    RAW_SYSCALL
    mov r8d, eax
    lea r9, [rip + num_buf + 32]
    xor ecx, ecx
.Ltemp_pid_loop:
    mov eax, r8d
    xor edx, edx
    mov r10d, 10
    div r10d
    mov r8d, eax
    add dl, '0'
    dec r9
    mov byte ptr [r9], dl
    inc ecx
    test r8d, r8d
    jne .Ltemp_pid_loop

    mov edx, ecx
    lea rdi, [rip + temp_path]
    add rdi, r12
    mov rsi, r9
    cld
    rep movsb
    add r12d, edx
    lea rax, [rip + temp_path]
    mov byte ptr [rax + r12], 0
    xor eax, eax
    ret
.Ltemp_path_fail:
    mov eax, 1
    ret

save_buffer_append:
    mov rax, qword ptr [rip + save_buf_len]
    mov rcx, SAVE_CAPACITY
    sub rcx, rax
    cmp rsi, rcx
    jbe .Lsave_buffer_copy
    push rdi
    push rsi
    call save_buffer_flush
    pop rsi
    pop rdi
    test eax, eax
    jne .Lsave_buffer_fail
.Lsave_buffer_copy:
    mov rdx, qword ptr [rip + save_buf_len]
    lea r8, [rip + save_buf]
    add r8, rdx
    mov r9, rsi
    mov rcx, rsi
    mov rsi, rdi
    mov rdi, r8
    cld
    rep movsb
    add qword ptr [rip + save_buf_len], r9
    xor eax, eax
    ret
.Lsave_buffer_fail:
    mov eax, 1
    ret

save_buffer_flush:
    mov rdx, qword ptr [rip + save_buf_len]
    test rdx, rdx
    jz .Lsave_flush_ok
    mov rdi, qword ptr [rip + save_fd]
    lea rsi, [rip + save_buf]
    call write_all
    test eax, eax
    jne .Lsave_flush_fail
    mov qword ptr [rip + save_buf_len], 0
.Lsave_flush_ok:
    xor eax, eax
    ret
.Lsave_flush_fail:
    mov eax, 1
    ret

load_file:
    call init_empty_buffer
    cmp dword ptr [rip + filename_len], 0
    jne .open
    ret

.open:
.Lload_open_retry:
    mov eax, SYS_open
    lea rdi, [rip + filename_buf]
    mov esi, O_RDONLY | O_CLOEXEC | O_NOFOLLOW
    xor edx, edx
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Lload_open_retry
    test rax, rax
    jns .Lload_opened
    cmp eax, -ENOENT
    je .new_file
    jmp fatal_open
.Lload_opened:
    mov r12, rax

.Lload_stat_retry:
    mov eax, SYS_fstat
    mov rdi, r12
    lea rsi, [rip + file_stat]
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Lload_stat_retry
    test rax, rax
    js .Lload_close_read_fail

    mov eax, dword ptr [rip + file_stat + STAT_ST_MODE]
    and eax, S_IFMT
    cmp eax, S_IFREG
    jne .Lload_close_type_fail
    mov rax, qword ptr [rip + file_stat + STAT_ST_DEV]
    mov qword ptr [rip + loaded_dev], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_INO]
    mov qword ptr [rip + loaded_ino], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_SIZE]
    mov qword ptr [rip + loaded_size], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_MTIME_SEC]
    mov qword ptr [rip + loaded_mtime_sec], rax
    mov rax, qword ptr [rip + file_stat + STAT_ST_MTIME_NSEC]
    mov qword ptr [rip + loaded_mtime_nsec], rax
    mov dword ptr [rip + loaded_exists], 1
    mov rax, qword ptr [rip + loaded_size]
    cmp rax, MAX_LOAD_BYTES
    jbe .read_loop
    mov dword ptr [rip + load_truncated], 1

.read_loop:
    mov rdx, MAX_LOAD_BYTES
    sub rdx, qword ptr [rip + load_input_bytes]
    jz .Lload_done
    cmp rdx, 4096
    jbe .Lload_read_size_ok
    mov edx, 4096
.Lload_read_size_ok:
.Lload_read_retry:
    mov eax, SYS_read
    mov rdi, r12
    lea rsi, [rip + file_read_buf]
    RAW_SYSCALL
    cmp eax, -EINTR
    je .Lload_read_retry
    test rax, rax
    js .Lload_close_read_fail
    jz .Lload_done
    mov r15, rax
    add qword ptr [rip + load_input_bytes], rax
    xor r13d, r13d

.parse_loop:
    cmp r13, r15
    jae .read_loop
    lea r14, [rip + file_read_buf]
    mov bl, byte ptr [r14 + r13]
    cmp bl, 10
    je .Lload_newline

    mov ecx, dword ptr [rip + line_count]
    dec ecx
    lea rdx, [rip + line_lengths]
    mov esi, dword ptr [rdx + rcx*4]
    cmp esi, LINE_CAP
    jb .load_store_byte
    mov dword ptr [rip + load_truncated], 1
    jmp .next_byte
.load_store_byte:
    mov edi, ecx
    call get_line_ptr
    mov byte ptr [rax + rsi], bl
    inc dword ptr [rdx + rcx*4]
    jmp .next_byte

.Lload_newline:
    mov ecx, dword ptr [rip + line_count]
    dec ecx
    lea rdx, [rip + line_lengths]
    mov esi, dword ptr [rdx + rcx*4]
    xor r10d, r10d
    test esi, esi
    jz .Lload_line_ending
    mov edi, ecx
    call get_line_ptr
    cmp byte ptr [rax + rsi - 1], 13
    jne .Lload_line_ending
    dec esi
    mov dword ptr [rdx + rcx*4], esi
    mov r10d, 1
.Lload_line_ending:
    mov eax, NEWLINE_LF
    test r10d, r10d
    jz .Lload_separator_ready
    mov eax, NEWLINE_CRLF
.Lload_separator_ready:
    mov ecx, dword ptr [rip + newline_mode]
    cmp ecx, NEWLINE_UNKNOWN
    je .Lload_store_newline_mode
    cmp ecx, eax
    je .Lload_add_newline
    mov dword ptr [rip + newline_mixed], 1
    jmp .Lload_add_newline
.Lload_store_newline_mode:
    mov dword ptr [rip + newline_mode], eax
.Lload_add_newline:
    mov ecx, dword ptr [rip + line_count]
    cmp ecx, MAX_LINES
    jb .load_add_line
    mov dword ptr [rip + load_truncated], 1
    jmp .Lload_done
.load_add_line:
    lea rdx, [rip + line_lengths]
    mov dword ptr [rdx + rcx*4], 0
    inc dword ptr [rip + line_count]

.next_byte:
    inc r13
    jmp .parse_loop

.Lload_done:
    mov eax, SYS_close
    mov rdi, r12
    RAW_SYSCALL
    mov dword ptr [rip + dirty_flag], 0
    cmp dword ptr [rip + load_truncated], 0
    je .load_ok_msg
    lea rdi, [rip + msg_file_truncated]
    call set_message_z
    ret
.load_ok_msg:
    cmp dword ptr [rip + newline_mixed], 0
    je .load_help_msg
    lea rdi, [rip + msg_mixed_newlines]
    call set_message_z
    ret
.load_help_msg:
    lea rdi, [rip + msg_help]
    call set_message_z
    ret

.Lload_close_read_fail:
    mov eax, SYS_close
    mov rdi, r12
    RAW_SYSCALL
    jmp fatal_read
.Lload_close_type_fail:
    mov eax, SYS_close
    mov rdi, r12
    RAW_SYSCALL
    jmp fatal_file_type
.new_file:
    lea rdi, [rip + msg_new_file]
    call set_message_z
    ret

init_empty_buffer:
    mov dword ptr [rip + line_count], 1
    mov dword ptr [rip + line_lengths], 0
    mov dword ptr [rip + load_truncated], 0
    mov qword ptr [rip + load_input_bytes], 0
    mov dword ptr [rip + newline_mode], NEWLINE_UNKNOWN
    mov dword ptr [rip + newline_mixed], 0
    mov dword ptr [rip + loaded_exists], 0
    mov dword ptr [rip + dirty_flag], 0
    mov dword ptr [rip + cursor_x], 0
    mov dword ptr [rip + cursor_y], 0
    mov dword ptr [rip + rowoff], 0
    mov dword ptr [rip + coloff], 0
    ret

get_line_ptr:
    mov eax, edi
    shl rax, 10
    add rax, qword ptr [rip + edit_ptr]
    ret

delete_char_at:
    mov r9d, edi
    lea rdx, [rip + line_lengths]
    mov ecx, dword ptr [rdx + r9*4]
    cmp esi, ecx
    jae .Ldelete_char_done
    call get_line_ptr
    mov r8, rax
    mov eax, ecx
    sub eax, esi
    dec eax
    jle .Ldelete_char_shrink
    lea rdi, [r8 + rsi]
    lea rsi, [r8 + rsi + 1]
    mov ecx, eax
    cld
    rep movsb
.Ldelete_char_shrink:
    dec dword ptr [rdx + r9*4]
    mov dword ptr [rip + dirty_flag], 1
.Ldelete_char_done:
    ret

merge_with_next:
    mov r9d, edi
    mov eax, dword ptr [rip + line_count]
    dec eax
    cmp r9d, eax
    jae .Lmerge_fail

    lea rdx, [rip + line_lengths]
    mov r10d, dword ptr [rdx + r9*4]
    mov r11d, dword ptr [rdx + r9*4 + 4]
    mov eax, r10d
    add eax, r11d
    cmp eax, LINE_CAP
    ja .Lmerge_fail

    mov edi, r9d
    call get_line_ptr
    mov r8, rax
    mov edi, r9d
    inc edi
    call get_line_ptr
    mov rsi, rax
    lea rdi, [r8 + r10]
    mov ecx, r11d
    cld
    rep movsb
    lea rdx, [rip + line_lengths]
    mov eax, r10d
    add eax, r11d
    mov dword ptr [rdx + r9*4], eax

    mov r10d, r9d
    inc r10d
.Lmerge_shift:
    mov eax, dword ptr [rip + line_count]
    dec eax
    cmp r10d, eax
    jae .Lmerge_finish
    mov ecx, dword ptr [rdx + r10*4 + 4]
    mov dword ptr [rdx + r10*4], ecx
    mov edi, r10d
    inc edi
    call get_line_ptr
    mov rsi, rax
    mov edi, r10d
    call get_line_ptr
    mov rdi, rax
    mov ecx, dword ptr [rdx + r10*4]
    cld
    rep movsb
    inc r10d
    jmp .Lmerge_shift

.Lmerge_finish:
    dec dword ptr [rip + line_count]
    mov dword ptr [rip + dirty_flag], 1
    mov eax, 1
    ret

.Lmerge_fail:
    xor eax, eax
    ret

copy_c_string_to_filename:
    xor ecx, ecx
1:
    cmp ecx, FILE_CAPACITY
    jae 2f
    mov al, byte ptr [rdi + rcx]
    test al, al
    je 3f
    cmp ecx, FILE_CAPACITY - 1
    jae 2f
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rcx], al
    inc ecx
    jmp 1b
2:
    mov byte ptr [rip + filename_buf], 0
    mov dword ptr [rip + filename_len], 0
    mov eax, 1
    ret
3:
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rcx], 0
    mov dword ptr [rip + filename_len], ecx
    xor eax, eax
    ret

detect_syntax:
    mov dword ptr [rip + syntax_mode], SYNTAX_NONE
    cmp dword ptr [rip + filename_len], 0
    je .Ldetect_done

    lea rsi, [rip + c_ext_1]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_2]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_3]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_4]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_5]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_6]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_7]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_8]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_9]
    call has_extension
    test eax, eax
    jnz .set_c
    lea rsi, [rip + c_ext_10]
    call has_extension
    test eax, eax
    jnz .set_c

    lea rsi, [rip + asm_ext_1]
    call has_extension
    test eax, eax
    jnz .set_asm
    lea rsi, [rip + asm_ext_2]
    call has_extension
    test eax, eax
    jnz .set_asm
    lea rsi, [rip + asm_ext_3]
    call has_extension
    test eax, eax
    jnz .set_asm

    lea rsi, [rip + hash_ext_1]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_2]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_3]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_4]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_5]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_6]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_7]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_8]
    call has_extension
    test eax, eax
    jnz .set_hash
    lea rsi, [rip + hash_ext_9]
    call has_extension
    test eax, eax
    jnz .set_hash
.Ldetect_done:
    ret
.set_c:
    mov dword ptr [rip + syntax_mode], SYNTAX_CLIKE
    ret
.set_asm:
    mov dword ptr [rip + syntax_mode], SYNTAX_ASM
    ret
.set_hash:
    mov dword ptr [rip + syntax_mode], SYNTAX_HASH
    ret

has_extension:
    push rsi
    call zstrlen_rsi
    mov r8d, eax
    pop rsi
    mov eax, dword ptr [rip + filename_len]
    cmp eax, r8d
    jb .no
    sub eax, r8d
    lea rdi, [rip + filename_buf]
    add rdi, rax
1:
    mov al, byte ptr [rsi]
    test al, al
    je .yes
    cmp al, byte ptr [rdi]
    jne .no
    inc rsi
    inc rdi
    jmp 1b
.yes:
    mov eax, 1
    ret
.no:
    xor eax, eax
    ret

zstrlen_rsi:
    xor eax, eax
1:
    cmp byte ptr [rsi + rax], 0
    je 2f
    inc eax
    jmp 1b
2:
    ret

zstrlen_rdi:
    xor eax, eax
1:
    cmp byte ptr [rdi + rax], 0
    je 2f
    inc eax
    jmp 1b
2:
    ret

poll_stdin:
.Lpoll_retry:
    mov dword ptr [rip + stdin_pollfd], STDIN_FD
    mov word ptr [rip + stdin_pollfd + 4], POLLIN
    mov word ptr [rip + stdin_pollfd + 6], 0
    mov edx, edi
    mov eax, SYS_poll
    lea rdi, [rip + stdin_pollfd]
    mov esi, 1
    RAW_SYSCALL
    cmp eax, -EINTR
    jne .Lpoll_not_interrupted
    cmp dword ptr [rip + termination_signal], 0
    je .Lpoll_retry
    mov eax, -1
    ret
.Lpoll_not_interrupted:
    test eax, eax
    jle .Lpoll_ret
    movzx eax, word ptr [rip + stdin_pollfd + 6]
    test eax, POLLIN
    jnz .Lpoll_ready
    mov eax, -1
    ret
.Lpoll_ready:
    mov eax, 1
.Lpoll_ret:
    ret

read_stdin_byte:
.Lread_byte_retry:
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    RAW_SYSCALL
    cmp rax, 1
    je .Lread_byte_ok
    cmp eax, -EINTR
    jne .Lread_byte_error
    cmp dword ptr [rip + termination_signal], 0
    je .Lread_byte_retry
.Lread_byte_error:
    mov eax, -1
    ret
.Lread_byte_ok:
    movzx eax, byte ptr [rip + input_buf]
    ret

read_key:
    cmp dword ptr [rip + have_pending], 0
    je 2f
    mov eax, dword ptr [rip + pending_key]
    mov dword ptr [rip + have_pending], 0
    ret
2:
    mov edi, -1
    call poll_stdin
    cmp eax, 1
    jne .Lrk_error
    call read_stdin_byte
    test eax, eax
    js .Lrk_error
    cmp eax, KEY_ESC
    jne .Lrk_done

    mov edi, ESC_TIMEOUT_MS
    call poll_stdin
    test eax, eax
    js .Lrk_error
    cmp eax, 1
    jne .Lrk_esc_only
    call read_stdin_byte
    test eax, eax
    js .Lrk_error
    mov r12d, eax
    cmp r12b, '['
    je .Lrk_bracket
    cmp r12b, 'O'
    je .Lrk_ofamily
    mov dword ptr [rip + pending_key], r12d
    mov dword ptr [rip + have_pending], 1
    jmp .Lrk_esc_only

.Lrk_bracket:
    xor r13d, r13d
.Lrk_csi_loop:
    mov edi, ESC_TIMEOUT_MS
    call poll_stdin
    test eax, eax
    js .Lrk_error
    cmp eax, 1
    jne .Lrk_esc_only
    call read_stdin_byte
    test eax, eax
    js .Lrk_error
    cmp r13d, ESC_CAPACITY
    jae .Lrk_esc_only
    lea rdx, [rip + escape_buf]
    mov byte ptr [rdx + r13], al
    inc r13d
    cmp al, 0x40
    jb .Lrk_csi_loop
    cmp al, 0x7e
    ja .Lrk_csi_loop

    movzx r14d, al
    cmp r14b, 'A'
    je .Lrk_up
    cmp r14b, 'B'
    je .Lrk_down
    cmp r14b, 'C'
    je .Lrk_right
    cmp r14b, 'D'
    je .Lrk_left
    cmp r14b, 'H'
    je .Lrk_home
    cmp r14b, 'F'
    je .Lrk_end
    cmp r14b, '~'
    jne .Lrk_esc_only

    xor r10d, r10d
    xor ecx, ecx
    mov r11d, r13d
    dec r11d
.Lrk_csi_number:
    cmp ecx, r11d
    jae .Lrk_csi_number_done
    lea rdx, [rip + escape_buf]
    movzx eax, byte ptr [rdx + rcx]
    cmp al, ';'
    je .Lrk_csi_number_done
    cmp al, '0'
    jb .Lrk_esc_only
    cmp al, '9'
    ja .Lrk_esc_only
    sub eax, '0'
    cmp r10d, 214748364
    ja .Lrk_esc_only
    jb .Lrk_csi_accumulate
    cmp eax, 7
    ja .Lrk_esc_only
.Lrk_csi_accumulate:
    imul r10d, r10d, 10
    add r10d, eax
    cmp r10d, 8
    ja .Lrk_esc_only
    inc ecx
    jmp .Lrk_csi_number
.Lrk_csi_number_done:
    cmp r10d, 1
    je .Lrk_home
    cmp r10d, 3
    je .Lrk_delete
    cmp r10d, 4
    je .Lrk_end
    cmp r10d, 5
    je .Lrk_pageup
    cmp r10d, 6
    je .Lrk_pagedown
    cmp r10d, 7
    je .Lrk_home
    cmp r10d, 8
    je .Lrk_end
    jmp .Lrk_esc_only

.Lrk_ofamily:
    mov edi, ESC_TIMEOUT_MS
    call poll_stdin
    test eax, eax
    js .Lrk_error
    cmp eax, 1
    jne .Lrk_esc_only
    call read_stdin_byte
    test eax, eax
    js .Lrk_error
    cmp al, 'A'
    je .Lrk_up
    cmp al, 'B'
    je .Lrk_down
    cmp al, 'C'
    je .Lrk_right
    cmp al, 'D'
    je .Lrk_left
    cmp al, 'H'
    je .Lrk_home
    cmp al, 'F'
    je .Lrk_end
    jmp .Lrk_esc_only

.Lrk_left:
    mov eax, KEY_ARROW_LEFT
    ret
.Lrk_right:
    mov eax, KEY_ARROW_RIGHT
    ret
.Lrk_up:
    mov eax, KEY_ARROW_UP
    ret
.Lrk_down:
    mov eax, KEY_ARROW_DOWN
    ret
.Lrk_home:
    mov eax, KEY_HOME
    ret
.Lrk_end:
    mov eax, KEY_END
    ret
.Lrk_pageup:
    mov eax, KEY_PAGEUP
    ret
.Lrk_pagedown:
    mov eax, KEY_PAGEDOWN
    ret
.Lrk_delete:
    mov eax, KEY_DELETE
    ret
.Lrk_error:
    mov dword ptr [rip + quit_flag], 1
    mov eax, dword ptr [rip + termination_signal]
    test eax, eax
    jz .Lrk_io_error
    add eax, 128
    mov dword ptr [rip + exit_status], eax
    jmp .Lrk_error_key
.Lrk_io_error:
    mov dword ptr [rip + exit_status], 1
.Lrk_error_key:
    mov eax, KEY_ESC
    ret
.Lrk_esc_only:
    mov eax, KEY_ESC
.Lrk_done:
    ret

move_left:
    mov eax, dword ptr [rip + cursor_x]
    test eax, eax
    jz .check_wrap
    dec eax
    mov dword ptr [rip + cursor_x], eax
    ret
.check_wrap:
    cmp dword ptr [rip + editor_mode], MODE_INSERT
    jne .Lmove_left_done
.prev_line:
    mov eax, dword ptr [rip + cursor_y]
    test eax, eax
    jz .Lmove_left_done
    dec eax
    mov dword ptr [rip + cursor_y], eax
    mov edi, eax
    call line_length
    mov dword ptr [rip + cursor_x], eax
.Lmove_left_done:
    ret

move_right:
    mov edi, dword ptr [rip + cursor_y]
    call line_length
    mov ecx, eax
    cmp dword ptr [rip + editor_mode], MODE_INSERT
    je .Lmove_right_insert
    test ecx, ecx
    jz .Lmove_right_done
    dec ecx
    mov eax, dword ptr [rip + cursor_x]
    cmp eax, ecx
    jb .inc_x
    jmp .Lmove_right_done
.Lmove_right_insert:
    mov eax, dword ptr [rip + cursor_x]
    cmp eax, ecx
    jb .inc_x
    call total_lines
    mov ecx, eax
    mov eax, dword ptr [rip + cursor_y]
    inc eax
    cmp eax, ecx
    jae .Lmove_right_done
    mov dword ptr [rip + cursor_y], eax
    mov dword ptr [rip + cursor_x], 0
    ret
.inc_x:
    inc eax
    mov dword ptr [rip + cursor_x], eax
.Lmove_right_done:
    ret

move_up:
    mov eax, dword ptr [rip + cursor_y]
    test eax, eax
    jz .Lmove_up_clamp
    dec eax
    mov dword ptr [rip + cursor_y], eax
.Lmove_up_clamp:
    call clamp_cursor_x
    ret

move_down:
    call total_lines
    mov ecx, eax
    mov eax, dword ptr [rip + cursor_y]
    inc eax
    cmp eax, ecx
    jae .Lmove_down_clamp
    mov dword ptr [rip + cursor_y], eax
.Lmove_down_clamp:
    call clamp_cursor_x
    ret

clamp_cursor:
    call total_lines
    mov ecx, eax
    mov eax, dword ptr [rip + cursor_y]
    cmp eax, ecx
    jb .y_ok
    dec ecx
    mov dword ptr [rip + cursor_y], ecx
.y_ok:
    call clamp_cursor_x
    ret

clamp_cursor_x:
    mov edi, dword ptr [rip + cursor_y]
    call line_length
    mov ecx, eax
    cmp dword ptr [rip + editor_mode], MODE_INSERT
    je .Lclampx_apply
    test ecx, ecx
    jz .Lclampx_apply
    dec ecx
.Lclampx_apply:
    mov eax, dword ptr [rip + cursor_x]
    cmp eax, ecx
    jbe .Lclampx_done
    mov dword ptr [rip + cursor_x], ecx
.Lclampx_done:
    ret

insert_byte:
    push r12
    push r13
    push r14
    push r15
    mov r12d, dword ptr [rip + cursor_y]
    lea r13, [rip + line_lengths]
    mov r14d, dword ptr [r13 + r12*4]
    mov r15d, dword ptr [rip + cursor_x]
    cmp r15d, r14d
    jbe .Linsert_col_ok
    mov r15d, r14d
    mov dword ptr [rip + cursor_x], r15d

.Linsert_col_ok:
    mov al, byte ptr [rip + insert_char_tmp]
    cmp al, 10
    je .Linsert_newline

    cmp r14d, LINE_CAP
    jae .Linsert_full
    mov edi, r12d
    call get_line_ptr
    mov r8, rax
    mov ecx, r14d
    sub ecx, r15d
    jle .Linsert_store
    lea rsi, [r8 + r14 - 1]
    lea rdi, [r8 + r14]
    std
    rep movsb
    cld

.Linsert_store:
    mov al, byte ptr [rip + insert_char_tmp]
    mov byte ptr [r8 + r15], al
    inc dword ptr [r13 + r12*4]
    inc dword ptr [rip + cursor_x]
    mov dword ptr [rip + dirty_flag], 1
    jmp .Linsert_done

.Linsert_newline:
    mov eax, dword ptr [rip + line_count]
    cmp eax, MAX_LINES
    jae .Linsert_full

    mov r10d, eax
    dec r10d
.Linsert_shift_lines:
    mov eax, r12d
    inc eax
    cmp r10d, eax
    jl .Linsert_split
    mov edx, dword ptr [r13 + r10*4]
    mov dword ptr [r13 + r10*4 + 4], edx
    mov edi, r10d
    call get_line_ptr
    mov rsi, rax
    lea rdi, [rax + LINE_CAP]
    mov ecx, edx
    cld
    rep movsb
    dec r10d
    jmp .Linsert_shift_lines

.Linsert_split:
    mov eax, r14d
    sub eax, r15d
    mov r10d, eax
    mov edi, r12d
    call get_line_ptr
    mov r8, rax
    lea r9, [r8 + LINE_CAP]
    test r10d, r10d
    jz .Linsert_no_tail
    lea rsi, [r8 + r15]
    mov rdi, r9
    mov ecx, r10d
    cld
    rep movsb

.Linsert_no_tail:
    mov dword ptr [r13 + r12*4], r15d
    mov eax, r12d
    inc eax
    mov dword ptr [r13 + rax*4], r10d
    inc dword ptr [rip + line_count]
    inc dword ptr [rip + cursor_y]
    mov dword ptr [rip + cursor_x], 0
    mov dword ptr [rip + dirty_flag], 1
    jmp .Linsert_done

.Linsert_full:
    lea rdi, [rip + msg_buffer_full]
    call set_message_z

.Linsert_done:
    pop r15
    pop r14
    pop r13
    pop r12
    ret

backspace_byte:
    mov eax, dword ptr [rip + cursor_x]
    test eax, eax
    jz .Lbackspace_join
    dec eax
    mov dword ptr [rip + cursor_x], eax
    mov edi, dword ptr [rip + cursor_y]
    mov esi, eax
    call delete_char_at
    ret

.Lbackspace_join:
    mov eax, dword ptr [rip + cursor_y]
    test eax, eax
    jz .Lbackspace_done
    dec eax
    mov edi, eax
    call line_length
    push rax
    mov edi, dword ptr [rip + cursor_y]
    dec edi
    call merge_with_next
    test eax, eax
    jz .Lbackspace_merge_failed
    pop rax
    mov dword ptr [rip + cursor_x], eax
    mov eax, dword ptr [rip + cursor_y]
    dec eax
    mov dword ptr [rip + cursor_y], eax
    ret
.Lbackspace_merge_failed:
    add rsp, 8
.Lbackspace_done:
    ret

delete_at_cursor:
    mov edi, dword ptr [rip + cursor_y]
    call line_length
    mov ecx, eax
    mov esi, dword ptr [rip + cursor_x]
    cmp esi, ecx
    jb .Ldelete_same_line
    mov edi, dword ptr [rip + cursor_y]
    call merge_with_next
    jmp .Ldelete_at_done

.Ldelete_same_line:
    mov edi, dword ptr [rip + cursor_y]
    call delete_char_at
.Ldelete_at_done:
    ret

line_length:
    mov eax, dword ptr [rip + line_count]
    cmp edi, eax
    jb .have_line
    xor eax, eax
    ret
.have_line:
    lea rax, [rip + line_lengths]
    mov eax, dword ptr [rax + rdi*4]
    ret

total_lines:
    mov eax, dword ptr [rip + line_count]
    ret

render_line:
    push r12
    push r13
    push r14
    push r15
    mov eax, dword ptr [rip + line_count]
    cmp edi, eax
    jae 9f
    call get_line_ptr
    mov r12, rax
    lea rax, [rip + line_lengths]
    mov r13d, dword ptr [rax + rdi*4]
    xor r14d, r14d

1:
    cmp r14d, r13d
    jae 9f

    mov eax, dword ptr [rip + syntax_mode]
    cmp eax, SYNTAX_ASM
    jne 2f
    cmp byte ptr [r12 + r14], ';'
    jne 2f
    lea rdi, [r12 + r14]
    mov esi, r13d
    sub esi, r14d
    mov edx, COLOR_COMMENT
    mov ecx, r14d
    call emit_token
    jmp 9f

2:
    mov eax, dword ptr [rip + syntax_mode]
    cmp eax, SYNTAX_HASH
    jne 3f
    cmp byte ptr [r12 + r14], '#'
    jne 3f
    lea rdi, [r12 + r14]
    mov esi, r13d
    sub esi, r14d
    mov edx, COLOR_COMMENT
    mov ecx, r14d
    call emit_token
    jmp 9f

3:
    mov eax, dword ptr [rip + syntax_mode]
    cmp eax, SYNTAX_CLIKE
    jne 4f
    cmp byte ptr [r12 + r14], '/'
    jne 4f
    mov eax, r14d
    inc eax
    cmp eax, r13d
    jae 4f
    cmp byte ptr [r12 + r14 + 1], '/'
    jne 4f
    lea rdi, [r12 + r14]
    mov esi, r13d
    sub esi, r14d
    mov edx, COLOR_COMMENT
    mov ecx, r14d
    call emit_token
    jmp 9f

4:
    mov al, byte ptr [r12 + r14]
    cmp al, '"'
    je .Lrender_string
    cmp al, '\''
    jne 5f
.Lrender_string:
    mov r15b, al
    mov r10d, r14d
    inc r10d
6:
    cmp r10d, r13d
    jae 7f
    cmp byte ptr [r12 + r10], r15b
    je 8f
    inc r10d
    jmp 6b
8:
    inc r10d
7:
    lea rdi, [r12 + r14]
    mov esi, r10d
    sub esi, r14d
    mov edx, COLOR_STRING
    mov ecx, r14d
    call emit_token
    mov r14d, r10d
    jmp 1b

5:
    mov al, byte ptr [r12 + r14]
    cmp al, '0'
    jb .Lrender_word
    cmp al, '9'
    ja .Lrender_word
    cmp r14d, 0
    je .Lrender_number
    mov al, byte ptr [r12 + r14 - 1]
    call is_ident_char_al
    test eax, eax
    jnz .Lrender_word
.Lrender_number:
    mov r10d, r14d
10:
    cmp r10d, r13d
    jae 11f
    mov al, byte ptr [r12 + r10]
    cmp al, '0'
    jb 12f
    cmp al, '9'
    jbe 13f
12:
    cmp al, 'a'
    jb 14f
    cmp al, 'f'
    jbe 13f
14:
    cmp al, 'A'
    jb 15f
    cmp al, 'F'
    jbe 13f
15:
    cmp al, 'x'
    je 13f
    cmp al, 'X'
    je 13f
    cmp al, '.'
    je 13f
    jmp 11f
13:
    inc r10d
    jmp 10b
11:
    lea rdi, [r12 + r14]
    mov esi, r10d
    sub esi, r14d
    mov edx, COLOR_NUMBER
    mov ecx, r14d
    call emit_token
    mov r14d, r10d
    jmp 1b

.Lrender_word:
    mov al, byte ptr [r12 + r14]
    call is_word_start_al
    test eax, eax
    jz .single
    mov r10d, r14d
16:
    cmp r10d, r13d
    jae 17f
    mov al, byte ptr [r12 + r10]
    call is_ident_char_al
    test eax, eax
    jz 17f
    inc r10d
    jmp 16b
17:
    lea rdi, [r12 + r14]
    mov esi, r10d
    sub esi, r14d
    push r10
    call keyword_match
    pop r10
    test eax, eax
    jz .plain
    lea rdi, [r12 + r14]
    mov esi, r10d
    sub esi, r14d
    mov edx, COLOR_KEYWORD
    mov ecx, r14d
    call emit_token
    mov r14d, r10d
    jmp 1b

.plain:
    lea rdi, [r12 + r14]
    mov esi, r10d
    sub esi, r14d
    mov edx, COLOR_DEFAULT
    mov ecx, r14d
    call emit_token
    mov r14d, r10d
    jmp 1b

.single:
    lea rdi, [r12 + r14]
    mov esi, 1
    mov edx, COLOR_DEFAULT
    mov ecx, r14d
    call emit_token
    inc r14d
    jmp 1b

9:
    pop r15
    pop r14
    pop r13
    pop r12
    ret

emit_token:
    push r10
    push r11
    mov r8d, dword ptr [rip + coloff]
    mov eax, ecx
    add eax, esi
    cmp eax, r8d
    jle .Lemit_done

    mov r9d, dword ptr [rip + coloff]
    add r9d, dword ptr [rip + view_cols]
    cmp ecx, r9d
    jge .Lemit_done

    mov r10d, ecx
    cmp r10d, r8d
    jge 1f
    mov r10d, r8d
1:
    mov r11d, ecx
    add r11d, esi
    cmp r11d, r9d
    jle 2f
    mov r11d, r9d
2:
    sub r11d, r10d
    jle .Lemit_done

    mov eax, r10d
    sub eax, ecx
    lea rdi, [rdi + rax]
    mov esi, r11d

    push rdi
    push rsi
    mov edi, edx
    call ab_set_color
    pop rsi
    pop rdi
    call ab_append_text_ptr_len
.Lemit_done:
    pop r11
    pop r10
    ret

append_line_prefix:
    push rbx
    push rdi
    mov edi, COLOR_GUTTER
    call ab_set_color
    mov ebx, dword ptr [rsp]

    cmp ebx, 1000
    jae 1f
    mov al, ' '
    call ab_append_char
1:
    cmp ebx, 100
    jae 2f
    mov al, ' '
    call ab_append_char
2:
    cmp ebx, 10
    jae 3f
    mov al, ' '
    call ab_append_char
3:
    mov edi, ebx
    call ab_append_uint
    add rsp, 8
    pop rbx
    lea rdi, [rip + pipe_space]
    mov esi, PIPE_SPACE_LEN
    call ab_append_ptr_len
    mov edi, COLOR_DEFAULT
    call ab_set_color
    ret

visible_width_for_line:
    call line_length
    mov ecx, dword ptr [rip + coloff]
    cmp eax, ecx
    jg 1f
    xor eax, eax
    ret
1:
    sub eax, ecx
    mov ecx, dword ptr [rip + view_cols]
    cmp eax, ecx
    jle 2f
    mov eax, ecx
2:
    ret

pad_line_to_view:
    mov ecx, dword ptr [rip + view_cols]
    sub ecx, edi
    jle .Lpad_done
    call ab_append_spaces
.Lpad_done:
    ret

ab_append_spaces:
    push rbx
    mov ebx, ecx
.Lappend_spaces_loop:
    test ebx, ebx
    jz .Lappend_spaces_done
    mov esi, ebx
    cmp esi, 256
    jbe .Lappend_spaces_chunk
    mov esi, 256
.Lappend_spaces_chunk:
    sub ebx, esi
    lea rdi, [rip + space_block]
    call ab_append_ptr_len
    jmp .Lappend_spaces_loop
.Lappend_spaces_done:
    pop rbx
    ret

append_empty_prefix:
    mov edi, COLOR_GUTTER
    call ab_set_color
    mov ecx, PREFIX_WIDTH
1:
    mov al, ' '
    call ab_append_char
    dec ecx
    jnz 1b
    ret

append_scrollbar:
    push rbx
    push r12
    mov r12d, edi
    mov eax, dword ptr [rip + text_rows]
    test eax, eax
    jz .Lbar_track
    mov ecx, dword ptr [rip + total_lines_cache]
    cmp ecx, eax
    jle .Lscroll_full
    mov ebx, eax
    imul eax, ebx
    xor edx, edx
    div ecx
    test eax, eax
    jnz 1f
    mov eax, 1
1:
    mov r8d, eax
    mov eax, dword ptr [rip + text_rows]
    sub eax, r8d
    mov ebx, dword ptr [rip + total_lines_cache]
    dec ebx
    jle 2f
    imul eax, dword ptr [rip + cursor_y]
    xor edx, edx
    div ebx
    mov r9d, eax
    jmp 3f
2:
    xor r9d, r9d
    jmp 3f
.Lscroll_full:
    mov r8d, dword ptr [rip + text_rows]
    xor r9d, r9d
3:
    cmp r12d, r9d
    jb .Lbar_track
    mov eax, r9d
    add eax, r8d
    cmp r12d, eax
    jb .Lbar_thumb
.Lbar_track:
    mov edi, COLOR_SCROLL_TRACK
    call ab_set_color
    mov al, '|'
    call ab_append_char
    jmp .Lbar_done
.Lbar_thumb:
    mov edi, COLOR_SCROLL_THUMB
    call ab_set_color
    mov al, '#'
    call ab_append_char
.Lbar_done:
    pop r12
    pop rbx
    ret

draw_status_bar:
    lea rdi, [rip + reverse_seq]
    mov esi, REVERSE_SEQ_LEN
    call ab_append_ptr_len

    cmp dword ptr [rip + screen_cols], 40
    jb .Lstatus_compact

    cmp dword ptr [rip + filename_len], 0
    jne 1f
    lea rdi, [rip + no_name_txt]
    call ab_append_z
    jmp 2f
1:
    lea rdi, [rip + filename_buf]
    mov esi, dword ptr [rip + filename_len]
    mov eax, dword ptr [rip + screen_cols]
    sub eax, 28
    cmp esi, eax
    jbe .Lstatus_filename_bounded
    mov esi, eax
.Lstatus_filename_bounded:
    call ab_append_safe_ptr_len
2:
    lea rdi, [rip + sep_txt]
    call ab_append_z
    call append_mode_text
    cmp dword ptr [rip + dirty_flag], 0
    je 3f
    lea rdi, [rip + dirty_txt]
    call ab_append_z
3:
    lea rdi, [rip + ln_txt]
    call ab_append_z
    mov edi, dword ptr [rip + cursor_y]
    inc edi
    call ab_append_uint
    lea rdi, [rip + slash_txt]
    call ab_append_z
    mov edi, dword ptr [rip + total_lines_cache]
    call ab_append_uint
    jmp .Lstatus_finish

.Lstatus_compact:
    mov eax, dword ptr [rip + editor_mode]
    cmp eax, MODE_INSERT
    je .Lstatus_compact_insert
    cmp eax, MODE_COMMAND
    je .Lstatus_compact_command
    lea rdi, [rip + mode_normal_txt]
    mov esi, MODE_NORMAL_LEN
    jmp .Lstatus_compact_append
.Lstatus_compact_insert:
    lea rdi, [rip + mode_insert_txt]
    mov esi, MODE_INSERT_LEN
    jmp .Lstatus_compact_append
.Lstatus_compact_command:
    lea rdi, [rip + mode_command_txt]
    mov esi, MODE_COMMAND_LEN
.Lstatus_compact_append:
    mov eax, dword ptr [rip + screen_cols]
    cmp esi, eax
    jbe .Lstatus_compact_bounded
    mov esi, eax
.Lstatus_compact_bounded:
    call ab_append_ptr_len

.Lstatus_finish:
    lea rdi, [rip + clear_line_seq]
    mov esi, CLEAR_LINE_LEN
    call ab_append_ptr_len
    lea rdi, [rip + reset_seq]
    mov esi, RESET_SEQ_LEN
    call ab_append_ptr_len
    lea rdi, [rip + crlf]
    mov esi, CRLF_LEN
    call ab_append_ptr_len
    ret

draw_message_bar:
    mov edi, COLOR_DEFAULT
    call ab_set_color
    cmp dword ptr [rip + editor_mode], MODE_COMMAND
    jne 1f
    mov al, ':'
    call ab_append_char
    lea rdi, [rip + command_buf]
    mov esi, dword ptr [rip + command_len]
    mov eax, dword ptr [rip + screen_cols]
    test eax, eax
    jz 2f
    dec eax
    cmp esi, eax
    jbe .Lmessage_command_bounded
    mov esi, eax
.Lmessage_command_bounded:
    call ab_append_ptr_len
    jmp 2f
1:
    lea rdi, [rip + message_buf]
    mov esi, dword ptr [rip + message_len]
    mov eax, dword ptr [rip + screen_cols]
    cmp esi, eax
    jbe .Lmessage_bounded
    mov esi, eax
.Lmessage_bounded:
    call ab_append_ptr_len
2:
    lea rdi, [rip + clear_line_seq]
    mov esi, CLEAR_LINE_LEN
    call ab_append_ptr_len
    ret

append_mode_text:
    mov eax, dword ptr [rip + editor_mode]
    cmp eax, MODE_INSERT
    je 1f
    cmp eax, MODE_COMMAND
    je 2f
    lea rdi, [rip + mode_normal_txt]
    jmp ab_append_z
1:
    lea rdi, [rip + mode_insert_txt]
    jmp ab_append_z
2:
    lea rdi, [rip + mode_command_txt]
    jmp ab_append_z

append_cursor_position:
    mov eax, dword ptr [rip + cursor_y]
    sub eax, dword ptr [rip + rowoff]
    inc eax
    mov r12d, eax
    mov eax, dword ptr [rip + cursor_x]
    sub eax, dword ptr [rip + coloff]
    add eax, PREFIX_WIDTH
    inc eax
    mov r13d, eax

    mov al, 27
    call ab_append_char
    mov al, '['
    call ab_append_char
    mov edi, r12d
    call ab_append_uint
    mov al, ';'
    call ab_append_char
    mov edi, r13d
    call ab_append_uint
    mov al, 'H'
    call ab_append_char
    ret

append_cursor_shape:
    mov eax, dword ptr [rip + editor_mode]
    cmp eax, MODE_INSERT
    je .Lcursor_bar
    lea rdi, [rip + cursor_block_seq]
    mov esi, CURSOR_BLOCK_LEN
    jmp ab_append_ptr_len
.Lcursor_bar:
    lea rdi, [rip + cursor_bar_seq]
    mov esi, CURSOR_BAR_LEN
    jmp ab_append_ptr_len

keyword_match:
    mov eax, dword ptr [rip + syntax_mode]
    cmp eax, SYNTAX_CLIKE
    je .c
    cmp eax, SYNTAX_ASM
    je .asm
    cmp eax, SYNTAX_HASH
    je .hash
    xor eax, eax
    ret
.c:
    lea r8, [rip + c_keywords]
    jmp .check
.asm:
    lea r8, [rip + asm_keywords]
    jmp .check
.hash:
    lea r8, [rip + hash_keywords]

.check:
    mov r9, r8
1:
    cmp byte ptr [r9], 0
    je .Lkw_no
    xor ecx, ecx
2:
    cmp byte ptr [r9 + rcx], 0
    je 3f
    inc ecx
    jmp 2b
3:
    cmp ecx, esi
    jne 5f
    xor r10d, r10d
4:
    cmp r10d, ecx
    jae .Lkw_yes
    mov al, byte ptr [rdi + r10]
    cmp al, byte ptr [r9 + r10]
    jne 5f
    inc r10d
    jmp 4b
5:
    add r9, rcx
    inc r9
    jmp 1b
.Lkw_yes:
    mov eax, 1
    ret
.Lkw_no:
    xor eax, eax
    ret

is_ident_char_al:
    cmp al, '0'
    jb 1f
    cmp al, '9'
    jbe .Lident_yes
1:
    cmp al, 'a'
    jb 2f
    cmp al, 'z'
    jbe .Lident_yes
2:
    cmp al, 'A'
    jb 3f
    cmp al, 'Z'
    jbe .Lident_yes
3:
    cmp al, '_'
    je .Lident_yes
    xor eax, eax
    ret
.Lident_yes:
    mov eax, 1
    ret

is_word_start_al:
    cmp al, 'a'
    jb 1f
    cmp al, 'z'
    jbe .Lwordstart_yes
1:
    cmp al, 'A'
    jb 2f
    cmp al, 'Z'
    jbe .Lwordstart_yes
2:
    cmp al, '_'
    je .Lwordstart_yes
    xor eax, eax
    ret
.Lwordstart_yes:
    mov eax, 1
    ret

ab_reset:
    mov qword ptr [rip + render_len], 0
    mov dword ptr [rip + current_color], COLOR_DEFAULT
    ret

ab_set_color:
    cmp edi, dword ptr [rip + current_color]
    je .Lsetcolor_done
    mov dword ptr [rip + current_color], edi
    cmp edi, COLOR_DEFAULT
    je .default
    cmp edi, COLOR_KEYWORD
    je .keyword
    cmp edi, COLOR_STRING
    je .Lsetcolor_string
    cmp edi, COLOR_NUMBER
    je .Lsetcolor_number
    cmp edi, COLOR_COMMENT
    je .comment
    cmp edi, COLOR_SCROLL_TRACK
    je .Lsetcolor_scroll_track
    cmp edi, COLOR_SCROLL_THUMB
    je .Lsetcolor_scroll_thumb
    lea rdi, [rip + color_gutter_seq]
    mov esi, COLOR_GUTTER_LEN
    jmp ab_append_ptr_len
.default:
    lea rdi, [rip + color_default_seq]
    mov esi, COLOR_DEFAULT_LEN
    jmp ab_append_ptr_len
.keyword:
    lea rdi, [rip + color_keyword_seq]
    mov esi, COLOR_KEYWORD_LEN
    jmp ab_append_ptr_len
.Lsetcolor_string:
    lea rdi, [rip + color_string_seq]
    mov esi, COLOR_STRING_LEN
    jmp ab_append_ptr_len
.Lsetcolor_number:
    lea rdi, [rip + color_number_seq]
    mov esi, COLOR_NUMBER_LEN
    jmp ab_append_ptr_len
.comment:
    lea rdi, [rip + color_comment_seq]
    mov esi, COLOR_COMMENT_LEN
    jmp ab_append_ptr_len
.Lsetcolor_scroll_track:
    lea rdi, [rip + color_scroll_track_seq]
    mov esi, COLOR_SCROLL_TRACK_LEN
    jmp ab_append_ptr_len
.Lsetcolor_scroll_thumb:
    lea rdi, [rip + color_scroll_thumb_seq]
    mov esi, COLOR_SCROLL_THUMB_LEN
    jmp ab_append_ptr_len
.Lsetcolor_done:
    ret

ab_append_ptr_len:
    mov r8, rdi
    mov r9, rsi
    mov rax, qword ptr [rip + render_len]
    mov r10, OUT_CAPACITY
    sub r10, rax
    cmp r9, r10
    jbe 1f
    mov r9, r10
1:
    test r9, r9
    jz .Lappend_ptr_done
    mov rdi, qword ptr [rip + render_ptr]
    add rdi, rax
    mov rsi, r8
    mov rcx, r9
    cld
    rep movsb
    add qword ptr [rip + render_len], r9
.Lappend_ptr_done:
    ret

ab_append_text_ptr_len:
    mov r8, rdi
    mov r9, rsi
.Lappend_text_loop:
    test r9, r9
    jz .Lappend_text_done
    mov r10, qword ptr [rip + render_len]
    cmp r10, OUT_CAPACITY
    jae .Lappend_text_done
    mov al, byte ptr [r8]
    cmp al, 32
    jb .Lappend_text_replace
    cmp al, 127
    je .Lappend_text_replace
    cmp al, 0x80
    jb .Lappend_text_store
    cmp al, 0x9f
    ja .Lappend_text_store
.Lappend_text_replace:
    mov al, '?'
.Lappend_text_store:
    mov rdi, qword ptr [rip + render_ptr]
    mov byte ptr [rdi + r10], al
    inc qword ptr [rip + render_len]
    inc r8
    dec r9
    jmp .Lappend_text_loop
.Lappend_text_done:
    ret

ab_append_safe_ptr_len:
    mov r8, rdi
    mov r9, rsi
1:
    test r9, r9
    jz 2f
    mov r10, qword ptr [rip + render_len]
    cmp r10, OUT_CAPACITY
    jae 2f
    mov al, byte ptr [r8]
    cmp al, 32
    jb 3f
    cmp al, 126
    ja 3f
    jmp 4f
3:
    mov al, '?'
4:
    mov rdi, qword ptr [rip + render_ptr]
    mov byte ptr [rdi + r10], al
    inc qword ptr [rip + render_len]
    inc r8
    dec r9
    jmp 1b
2:
    ret

ab_append_char:
    mov rdx, qword ptr [rip + render_len]
    cmp rdx, OUT_CAPACITY
    jae .Lappend_char_done
    mov rdi, qword ptr [rip + render_ptr]
    mov byte ptr [rdi + rdx], al
    inc qword ptr [rip + render_len]
.Lappend_char_done:
    ret

write_all:
    test rdx, rdx
    jz .Lwrite_all_ok
1:
    mov eax, SYS_write
    RAW_SYSCALL
    cmp eax, -EINTR
    jne 2f
    cmp dword ptr [rip + termination_signal], 0
    je 1b
    jmp .Lwrite_all_fail
2:
    test rax, rax
    jle .Lwrite_all_fail
    add rsi, rax
    sub rdx, rax
    jnz 1b
.Lwrite_all_ok:
    xor eax, eax
    ret
.Lwrite_all_fail:
    mov eax, 1
    ret

ab_append_z:
    push rdi
    call zstrlen_rdi
    pop rdi
    mov esi, eax
    jmp ab_append_ptr_len

ab_append_uint:
    push rbx
    mov eax, edi
    lea rsi, [rip + num_buf + 31]
    xor ecx, ecx
    cmp eax, 0
    jne 1f
    dec rsi
    mov byte ptr [rsi], '0'
    mov ecx, 1
    jmp 2f
1:
    xor edx, edx
    mov ebx, 10
    div ebx
    add dl, '0'
    dec rsi
    mov byte ptr [rsi], dl
    inc ecx
    test eax, eax
    jne 1b
2:
    mov rdi, rsi
    mov esi, ecx
    call ab_append_ptr_len
    pop rbx
    ret

set_message_z:
    xor ecx, ecx
1:
    cmp ecx, MSG_CAPACITY - 1
    jae 2f
    mov al, byte ptr [rdi + rcx]
    test al, al
    je 3f
    lea r8, [rip + message_buf]
    mov byte ptr [r8 + rcx], al
    inc ecx
    jmp 1b
2:
    lea r8, [rip + message_buf]
    mov byte ptr [r8 + MSG_CAPACITY - 1], 0
    mov dword ptr [rip + message_len], MSG_CAPACITY - 1
    ret
3:
    mov dword ptr [rip + message_len], ecx
    ret

.section .note.GNU-stack,"",@progbits
