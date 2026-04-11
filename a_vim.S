.intel_syntax noprefix

.equ SYS_read,        0
.equ SYS_write,       1
.equ SYS_open,        2
.equ SYS_close,       3
.equ SYS_poll,        7
.equ SYS_mmap,        9
.equ SYS_ioctl,       16
.equ SYS_exit,        60

.equ EINTR,           4

.equ STDIN_FD,        0
.equ STDOUT_FD,       1
.equ STDERR_FD,       2

.equ O_RDONLY,        0
.equ O_WRONLY,        1
.equ O_CREAT,         64
.equ O_TRUNC,         512

.equ PROT_READ,       1
.equ PROT_WRITE,      2
.equ MAP_PRIVATE,     2
.equ MAP_ANON,        32

.equ POLLIN,          0x0001

.equ TCGETS,          0x5401
.equ TCSETS,          0x5402
.equ TIOCGWINSZ,      0x5413

.equ BRKINT,          0x0002
.equ ICRNL,           0x0100
.equ INPCK,           0x0010
.equ ISTRIP,          0x0020
.equ IXON,            0x0400
.equ OPOST,           0x0001
.equ CS8,             0x00000030
.equ ECHO,            0x0008
.equ ICANON,          0x0002
.equ IEXTEN,          0x8000
.equ ISIG,            0x0001

.equ TERMIOS_IFLAG,   0
.equ TERMIOS_OFLAG,   4
.equ TERMIOS_CFLAG,   8
.equ TERMIOS_LFLAG,   12
.equ TERMIOS_VTIME,   22
.equ TERMIOS_VMIN,    23
.equ TERMIOS_SIZE,    36

.equ WS_ROW,          0
.equ WS_COL,          2

.equ MODE_NORMAL,     0
.equ MODE_INSERT,     1
.equ MODE_COMMAND,    2

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
.equ LINE_CAP,        1024
.equ MAX_LINES,       8192
.equ CMD_CAPACITY,    256
.equ FILE_CAPACITY,   256
.equ MSG_CAPACITY,    256
.equ PREFIX_WIDTH,    6

.section .data
hide_cursor_seq:      .ascii "\033[?25l"
.equ HIDE_CURSOR_LEN, . - hide_cursor_seq
show_cursor_seq:      .ascii "\033[?25h"
.equ SHOW_CURSOR_LEN, . - show_cursor_seq
cursor_block_seq:     .ascii "\033[2 q"
.equ CURSOR_BLOCK_LEN, . - cursor_block_seq
cursor_bar_seq:       .ascii "\033[6 q"
.equ CURSOR_BAR_LEN, . - cursor_bar_seq
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
msg_term_fail:        .asciz "failed to enter raw mode\n"
.equ MSG_TERM_FAIL_LEN, . - msg_term_fail - 1
msg_alloc_fail:       .asciz "failed to allocate memory\n"
.equ MSG_ALLOC_FAIL_LEN, . - msg_alloc_fail - 1

mode_normal_txt:      .asciz "NORMAL"
mode_insert_txt:      .asciz "INSERT"
mode_command_txt:     .asciz "COMMAND"
no_name_txt:          .asciz "[No Name]"
dirty_txt:            .asciz " [+]"
sep_txt:              .asciz " | "
ln_txt:               .asciz " Ln "
slash_txt:            .asciz "/"

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
.lcomm current_color,   4
.lcomm pending_key,     4
.lcomm have_pending,    4
.lcomm insert_char_tmp, 4
.lcomm line_count,      4
.lcomm line_lengths,    MAX_LINES * 4
.lcomm load_truncated,  4

.lcomm command_len,     4
.lcomm command_buf,     CMD_CAPACITY
.lcomm filename_len,    4
.lcomm filename_buf,    FILE_CAPACITY
.lcomm message_len,     4
.lcomm message_buf,     MSG_CAPACITY

.section .text
.global _start

_start:
    call alloc_buffers
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    mov dword ptr [rip + current_color], COLOR_DEFAULT

    mov rbx, rsp
    mov rax, qword ptr [rbx]
    cmp rax, 2
    jb .after_args
    mov rdi, qword ptr [rbx + 16]
    call copy_c_string_to_filename
    call detect_syntax
    call load_file

.after_args:
    cmp dword ptr [rip + message_len], 0
    jne .have_msg
    lea rdi, [rip + msg_help]
    call set_message_z

.have_msg:
    call enable_raw_mode
    test eax, eax
    jne fatal_term

.main_loop:
    call refresh_screen
    cmp dword ptr [rip + quit_flag], 0
    jne .leave_main_loop
    call process_keypress
    cmp dword ptr [rip + quit_flag], 0
    je .main_loop

.leave_main_loop:

    call disable_raw_mode
    mov eax, SYS_write
    mov edi, STDOUT_FD
    lea rsi, [rip + reset_seq]
    mov edx, RESET_SEQ_LEN
    syscall
    mov eax, SYS_write
    mov edi, STDOUT_FD
    lea rsi, [rip + cursor_block_seq]
    mov edx, CURSOR_BLOCK_LEN
    syscall
    mov eax, SYS_write
    mov edi, STDOUT_FD
    lea rsi, [rip + show_cursor_seq]
    mov edx, SHOW_CURSOR_LEN
    syscall
    mov eax, SYS_exit
    xor edi, edi
    syscall

fatal_alloc:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_alloc_fail]
    mov edx, MSG_ALLOC_FAIL_LEN
    syscall
    mov eax, SYS_exit
    mov edi, 1
    syscall

fatal_term:
    mov eax, SYS_write
    mov edi, STDERR_FD
    lea rsi, [rip + msg_term_fail]
    mov edx, MSG_TERM_FAIL_LEN
    syscall
    mov eax, SYS_exit
    mov edi, 1
    syscall

alloc_buffers:
    mov eax, SYS_mmap
    xor edi, edi
    mov esi, EDIT_CAPACITY
    mov edx, PROT_READ | PROT_WRITE
    mov r10d, MAP_PRIVATE | MAP_ANON
    mov r8, -1
    xor r9d, r9d
    syscall
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
    syscall
    test rax, rax
    js fatal_alloc
    mov qword ptr [rip + render_ptr], rax
    ret

enable_raw_mode:
    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCGETS
    lea rdx, [rip + orig_termios]
    syscall
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
    and eax, ~(ECHO | ICANON | IEXTEN | ISIG)
    mov dword ptr [rip + raw_termios + TERMIOS_LFLAG], eax

    mov byte ptr [rip + raw_termios + TERMIOS_VMIN], 1
    mov byte ptr [rip + raw_termios + TERMIOS_VTIME], 0

    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCSETS
    lea rdx, [rip + raw_termios]
    syscall
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
    mov eax, SYS_ioctl
    mov edi, STDIN_FD
    mov esi, TCSETS
    lea rdx, [rip + orig_termios]
    syscall
    mov dword ptr [rip + raw_enabled], 0
.Ldisable_raw_done:
    ret

get_window_size:
    mov eax, SYS_ioctl
    mov edi, STDOUT_FD
    mov esi, TIOCGWINSZ
    lea rdx, [rip + winsize]
    syscall
    test rax, rax
    js .fallback
    movzx eax, word ptr [rip + winsize + WS_ROW]
    test eax, eax
    jz .fallback
    mov dword ptr [rip + screen_rows], eax
    movzx eax, word ptr [rip + winsize + WS_COL]
    test eax, eax
    jz .fallback
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
    mov eax, dword ptr [rip + cursor_x]
    test eax, eax
    jz 1f
    dec eax
    mov dword ptr [rip + cursor_x], eax
1:
    mov dword ptr [rip + editor_mode], MODE_NORMAL
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
    jae .cmd_done
    lea rdx, [rip + command_buf]
    mov byte ptr [rdx + rcx], r12b
    inc ecx
    mov dword ptr [rip + command_len], ecx
.cmd_done:
    ret

.cancel_command:
    mov dword ptr [rip + editor_mode], MODE_NORMAL
    mov dword ptr [rip + command_len], 0
    lea rdi, [rip + msg_help]
    call set_message_z
    ret

.cmd_backspace:
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
    xor esi, esi
1:
    cmp edi, ecx
    jae 2f
    cmp esi, FILE_CAPACITY - 1
    jae 2f
    lea rdx, [rip + command_buf]
    mov al, byte ptr [rdx + rdi]
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rsi], al
    inc esi
    inc edi
    jmp 1b
2:
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rsi], 0
    mov dword ptr [rip + filename_len], esi
    call detect_syntax
    call save_file
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
    mov eax, SYS_open
    lea rdi, [rip + filename_buf]
    mov esi, O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 420
    syscall
    test rax, rax
    js .Lsave_fail
    mov r12, rax
    xor r13d, r13d

.line_loop:
    mov eax, dword ptr [rip + line_count]
    cmp r13d, eax
    jae .close_ok

    mov edi, r13d
    call get_line_ptr
    mov rsi, rax
    lea rdx, [rip + line_lengths]
    mov edx, dword ptr [rdx + r13*4]
    mov rdi, r12
    call write_all
    test eax, eax
    jne .close_fail

    mov eax, dword ptr [rip + line_count]
    dec eax
    cmp r13d, eax
    je .next_line

    mov rdi, r12
    lea rsi, [rip + lf_char]
    mov edx, 1
    call write_all
    test eax, eax
    jne .close_fail

.next_line:
    inc r13d
    jmp .line_loop

.close_ok:
    mov eax, SYS_close
    mov rdi, r12
    syscall
    mov dword ptr [rip + dirty_flag], 0
    lea rdi, [rip + msg_saved]
    call set_message_z
    xor eax, eax
    ret

.close_fail:
    mov eax, SYS_close
    mov rdi, r12
    syscall
.Lsave_fail:
    lea rdi, [rip + msg_save_fail]
    call set_message_z
    mov eax, 1
    ret

load_file:
    call init_empty_buffer
    cmp dword ptr [rip + filename_len], 0
    jne .open
    ret

.open:
    mov eax, SYS_open
    lea rdi, [rip + filename_buf]
    mov esi, O_RDONLY
    xor edx, edx
    syscall
    test rax, rax
    js .new_file
    mov r12, rax

.read_loop:
    mov eax, SYS_read
    mov rdi, r12
    lea rsi, [rip + file_read_buf]
    mov edx, 4096
    syscall
    test rax, rax
    js .close_new
    jz .Lload_done
    mov r15, rax
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
    cmp esi, LINE_CAP - 1
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
    cmp ecx, MAX_LINES
    jb .load_add_line
    mov dword ptr [rip + load_truncated], 1
    jmp .next_byte
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
    syscall
    mov dword ptr [rip + dirty_flag], 0
    cmp dword ptr [rip + load_truncated], 0
    je .load_ok_msg
    lea rdi, [rip + msg_file_truncated]
    call set_message_z
    ret
.load_ok_msg:
    lea rdi, [rip + msg_help]
    call set_message_z
    ret

.close_new:
    mov eax, SYS_close
    mov rdi, r12
    syscall
.new_file:
    lea rdi, [rip + msg_new_file]
    call set_message_z
    ret

init_empty_buffer:
    mov dword ptr [rip + line_count], 1
    mov dword ptr [rip + line_lengths], 0
    mov dword ptr [rip + load_truncated], 0
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
    jae .Lmerge_fail

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
    cmp ecx, FILE_CAPACITY - 1
    jae 2f
    mov al, byte ptr [rdi + rcx]
    lea r8, [rip + filename_buf]
    mov byte ptr [r8 + rcx], al
    test al, al
    je 3f
    inc ecx
    jmp 1b
2:
    mov byte ptr [rip + filename_buf + FILE_CAPACITY - 1], 0
    mov dword ptr [rip + filename_len], FILE_CAPACITY - 1
    ret
3:
    mov dword ptr [rip + filename_len], ecx
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
    syscall
    cmp eax, -EINTR
    je .Lpoll_retry
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

read_key:
    cmp dword ptr [rip + have_pending], 0
    je 2f
    mov eax, dword ptr [rip + pending_key]
    mov dword ptr [rip + have_pending], 0
    ret
2:
    mov edi, -1
    call poll_stdin
    test eax, eax
    js .Lrk_error
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    syscall
    cmp rax, 1
    jne .Lrk_error

    movzx eax, byte ptr [rip + input_buf]
    cmp eax, KEY_ESC
    jne .Lrk_done

    mov edi, 100
    call poll_stdin
    cmp eax, 1
    jne .Lrk_esc_only
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    syscall
    cmp rax, 1
    jne .Lrk_esc_only
    movzx r12d, byte ptr [rip + input_buf]
    cmp r12b, '['
    je .Lrk_bracket
    cmp r12b, 'O'
    je .Lrk_ofamily
    mov dword ptr [rip + pending_key], r12d
    mov dword ptr [rip + have_pending], 1
    jmp .Lrk_esc_only

.Lrk_bracket:
    mov edi, 100
    call poll_stdin
    cmp eax, 1
    jne .Lrk_esc_only
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    syscall
    cmp rax, 1
    jne .Lrk_esc_only
    movzx r13d, byte ptr [rip + input_buf]
    cmp r13b, 'A'
    je .Lrk_up
    cmp r13b, 'B'
    je .Lrk_down
    cmp r13b, 'C'
    je .Lrk_right
    cmp r13b, 'D'
    je .Lrk_left
    cmp r13b, 'H'
    je .Lrk_home
    cmp r13b, 'F'
    je .Lrk_end
    cmp r13b, '1'
    jb .Lrk_esc_only
    cmp r13b, '8'
    ja .Lrk_esc_only

    mov edi, 100
    call poll_stdin
    cmp eax, 1
    jne .Lrk_esc_only
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    syscall
    cmp rax, 1
    jne .Lrk_esc_only
    cmp byte ptr [rip + input_buf], '~'
    jne .Lrk_esc_only
    cmp r13b, '1'
    je .Lrk_home
    cmp r13b, '3'
    je .Lrk_delete
    cmp r13b, '4'
    je .Lrk_end
    cmp r13b, '5'
    je .Lrk_pageup
    cmp r13b, '6'
    je .Lrk_pagedown
    cmp r13b, '7'
    je .Lrk_home
    cmp r13b, '8'
    je .Lrk_end
    jmp .Lrk_esc_only

.Lrk_ofamily:
    mov edi, 100
    call poll_stdin
    cmp eax, 1
    jne .Lrk_esc_only
    mov eax, SYS_read
    mov edi, STDIN_FD
    lea rsi, [rip + input_buf]
    mov edx, 1
    syscall
    cmp rax, 1
    jne .Lrk_esc_only
    cmp byte ptr [rip + input_buf], 'H'
    je .Lrk_home
    cmp byte ptr [rip + input_buf], 'F'
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

    cmp r14d, LINE_CAP - 1
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
    mov edx, eax
    mov edi, eax
    call line_length
    mov dword ptr [rip + cursor_x], eax
    mov dword ptr [rip + cursor_y], edx
    mov edi, edx
    call merge_with_next
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
    call ab_append_ptr_len
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
1:
    mov al, ' '
    call ab_append_char
    dec ecx
    jnz 1b
.Lpad_done:
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

    cmp dword ptr [rip + filename_len], 0
    jne 1f
    lea rdi, [rip + no_name_txt]
    call ab_append_z
    jmp 2f
1:
    lea rdi, [rip + filename_buf]
    mov esi, dword ptr [rip + filename_len]
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
    call ab_append_ptr_len
    jmp 2f
1:
    lea rdi, [rip + message_buf]
    mov esi, dword ptr [rip + message_len]
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
    cmp dword ptr [rip + editor_mode], MODE_INSERT
    jne 1f
    test eax, eax
    jz 1f
    dec eax
1:
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
    syscall
    cmp eax, -EINTR
    je 1b
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
