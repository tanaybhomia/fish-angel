function fish_command_not_found
    # === Load config ===
    set -l freq 3
    set -l color "random"
    set -l messages

    if set -q COMMENT_FREQ
        set freq $COMMENT_FREQ
    end

    if set -q COMMENT_COLOR
        set color $COMMENT_COLOR
    end

    # === Load messages ===
    if set -q CMD_NOT_FOUND_MSGS
        set messages $CMD_NOT_FOUND_MSGS
    else if set -q COMMENT_MODE
        set -l mode_file (dirname (status -f))/../modes/$COMMENT_MODE.txt
        if test -f $mode_file
            set messages (cat $mode_file)
        end
    end

    # === Append messages if needed ===
    if set -q CMD_NOT_FOUND_MSGS_APPEND
        set -a messages $CMD_NOT_FOUND_MSGS_APPEND
    end

    # === Fallback message ===
    if not set -q messages[1]
        set messages "Oops! But you're still brilliant ✨"
    end

    # === Frequency check ===
    set -l rand_val (random 0 9)
    if test $rand_val -lt $freq
        set -l message $messages[(random 1 (count $messages))]

        if test "$color" = "random" -o "$color" = "0"
            set color (random 1 255)
        end

        printf "\n  %s\n\n" (set_color --bold $color; echo -n $message; set_color normal) >&2
    end

    # === Show original "command not found" message ===
    printf (_ "fish: Unknown command: %s\n") (string escape -- $argv[1]) >&2
end
