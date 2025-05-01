function fish_command_not_found
    # === Load config ===
    set -l freq 1
    set -l color "random"
    set -l messages

    if set -q COMMENT_FREQ
        set freq $COMMENT_FREQ
    end

    if set -q COMMENT_COLOR
        set color $COMMENT_COLOR
    end

    # === Load messages based on mode ===
    if set -q CMD_NOT_FOUND_MSGS
        set messages $CMD_NOT_FOUND_MSGS
    else if set -q COMMENT_MODE
        switch $COMMENT_MODE
            case "wild"
                set messages "RAWR! That command was fierce... and wrong!"
                set -a messages "You're a wild coder! Untamed typos await!"
                set -a messages "That command went off the rails — love it!"
                set -a messages "WILD INPUT DETECTED. KEEP GOING!"
            case "zen"
                set messages "Breathe. It's just a typo."
                set -a messages "Calm minds debug best."
                set -a messages "Let go of the error, keep flowing."
                set -a messages "One mistake does not define you."
            case '*'
                set messages "Oops! But you're still brilliant ✨"
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
