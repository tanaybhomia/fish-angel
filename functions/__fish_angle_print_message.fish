function __fish_angel_print_message
    set -l freq 1
    set -l color 0
    set -l messages

    # Get env config
    if set -q COMMENT_FREQ
        set freq $COMMENT_FREQ
    end

    if set -q COMMENT_COLOR
        set color $COMMENT_COLOR
    end

    # Load messages
    if set -q CMD_NOT_FOUND_MSGS
        set messages $CMD_NOT_FOUND_MSGS
    else if set -q COMMENT_MODE
        set -l mode_file (dirname (status -f))/../modes/$COMMENT_MODE.txt
        if test -f $mode_file
            set messages (cat $mode_file)
        end
    end

    # Append messages
    if set -q CMD_NOT_FOUND_MSGS_APPEND
        set -a messages $CMD_NOT_FOUND_MSGS_APPEND
    end

    # Fallback
    if not set -q messages[1]
        set messages "Oops! But you're still brilliant ✨"
    end

    # Decide if message should be printed
    if test (random) % 10 -lt $freq
        set -l message $messages[(random 1 (count $messages))]

        if test "$color" = "random" -o "$color" = "0"
            set color (random 1 255)
        end

        printf "\n  %s\n\n" (set_color --bold $color; echo -n $message; set_color normal) >&2
    end
end
