# Angel Helper – Supportive Fish Plugin
# Author: Tanay
# Description: Encouraging messages when commands are not found

function __angel_print_message
    set color 0
    set freq 9
    set messages \
        "Oops! That didn't work, but you're learning!" \
        "You're doing great—mistakes mean progress!" \
        "Don't worry, even pros make typos!" \
        "Every error is a step toward mastery!" \
        "Keep going! You'll get it soon!" \
        "You're smarter than this terminal makes you feel." \
        "The command line believes in you." \
        "Error? More like opportunity to grow!" \
        "You're one line closer to being a wizard!" \
        "Try again—success is right around the corner." \
        "Command not found, but faith in you is!" \
        "Your persistence is impressive!" \
        "Small setback, big comeback!" \
        "One step at a time, you've got this!" \
        "Even the best get stuck sometimes." \
        "Let’s try that again, shall we?" \
        "Stay curious. Stay kind to yourself." \
        "Don't give up. You're learning." \
        "You're building muscle memory!" \
        "The only real mistake is not trying again." \
        "This is part of the process. Keep at it!" \
        "You're better at this than you think." \
        "Nobody was born knowing shell commands." \
        "Keep typing, keep growing!" \
        "Every error is a future win in disguise." \
        "You’re not alone — even the best make mistakes." \
        "Oh dear, that command doesn't exist — but you do, and that's what matters." \
        "A small misstep, but fear not. Even angels trip over clouds sometimes." \
        "The heavens whisper: 'Try again, brave soul — you are learning fast.'" \
        "That wasn't the right command, but it was the right effort. Keep going." \
        "A gentle reminder: check your spelling and try once more." \
        "The stars are aligning for your next attempt. Do not be discouraged." \
        "You typed something unknown, but your courage is known." \
        "A tiny stumble on the path of mastery. Continue walking with grace." \
        "An angel watches with quiet admiration as you persevere." \
        "This command is unknown, but your potential is not." \
        "Even celestial beings must sometimes repeat their tasks. Try again." \
        "Not quite right, but closer than before. Wisdom takes time." \
        "Command not found — but your journey continues." \
        "Divine guidance suggests a second look at the manual." \
        "The quiet voice within says, 'You will get it next time.'" \
        "The skies remain patient. So should you." \
        "The shell does not understand, but you are understood." \
        "Learning is a sacred process. Trust it." \
        "That wasn't it — but you're getting warmer." \
        "This is not failure. This is refinement." \
        "All great journeys begin with missteps." \
        "What you seek may lie just one command away." \
        "The road is long, but you are not alone." \
        "You are building something — command by command." \
        "Even the quietest effort echoes in eternity." \
        "A moment of confusion is just a prelude to clarity." \
        "You are seen. You are guided. You are capable." \
        "The shell may reject commands, but never your intent." \
        "Trust the process. You are unfolding into something great."

        # Seed RANDOM with an integer of some length
        set RANDOM (random)

        test -n "$COMMENT_FREQ" && set freq $COMMENT_FREQ
        test -n "$CMD_NOT_FOUND_MSGS" && set messages $CMD_NOT_FOUND_MSGS
        test -n "$CMD_NOT_FOUND_MSGS_APPEND" && set -a messages $CMD_NOT_FOUND_MSGS_APPEND

        test -n "$COMMENT_COLOR" && set color $COMMENT_COLOR
        if [ $color = 0 ];
            set color (random 1 255)
        end

        # Print a randomly selected message, but only about half the time to annoy the user a
        # little bit less.
        if test (math $RANDOM % 10) -lt $freq;
            set message $messages[(math \( $RANDOM % (count $messages) \) + 1)]
            printf "\\n  %s\\n\\n" "$(tput bold)$(tput setaf $color)$message$(tput sgr0)" >&2
        end

    end

function fish_command_not_found
    __angel_print_message
    __fish_default_command_not_found_handler $argv
end
