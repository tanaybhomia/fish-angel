function angel
    set -l args $argv
    set -l i 1

    while test $i -le (count $args)
        switch $args[$i]
            case '-g'
                set -gx COMMENT_COLOR 2
            case '-b'
                set -gx COMMENT_COLOR 4
            case '-r'
                set -gx COMMENT_COLOR random
            case '-f'
                set -l next_idx (math $i + 1)
                if test $next_idx -le (count $args)
                    set -gx COMMENT_FREQ $args[$next_idx]
                    set i $next_idx
                end
            case '-m'
                set -l next_idx (math $i + 1)
                if test $next_idx -le (count $args)
                    set -gx CMD_NOT_FOUND_MSGS $args[$next_idx]
                    set i $next_idx
                end
            case '-a'
                set -l next_idx (math $i + 1)
                if test $next_idx -le (count $args)
                    set -gx CMD_NOT_FOUND_MSGS_APPEND $args[$next_idx]
                    set i $next_idx
                end
            case '-zen' '-wild'
                set -gx COMMENT_MODE (string replace -a '-' '' $args[$i])
            case '-h' '--help'
                echo "Usage: angel [options]"
                echo "  -g         Green color"
                echo "  -b         Blue color"
                echo "  -r         Random color"
                echo "  -f <n>     Frequency (0–10)"
                echo "  -m <msg>   Replace all messages with this"
                echo "  -a <msg>   Append this to message list"
                echo "  -zen       Activate Zen mode"
                echo "  -wild      Activate Wild mode"
                return 0
        end
        set i (math $i + 1)
    end

    echo "fishAngel config updated ✅"
end
