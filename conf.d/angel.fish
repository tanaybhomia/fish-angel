# Author: You
# Based on: AlazOz's fish-insulter

function __complimenter_print_message
    set color 0
    set freq 4
    set messages \
        "You're doing great!" \
        "Even the best make mistakes." \
        "Your curiosity is inspiring!" \
        "Keep going, you're learning!" \
        "Mistakes are proof you're trying." \
        "You're awesome, don't worry about it!" \
        "Every expert was once a beginner." \
        "Typing is hard, you're doing your best!" \
        "You're destined for greatness!" \
        "That was a unique approach!" \
        "You're a star in the making!" \
        "You have potential beyond measure." \
        "It's okay, you're still amazing!" \
        "I believe in you!" \
        "You're better than you think." \
        "Who cares about typos? You're a genius!" \
        "That command was... artistically incorrect." \
        "You light up the terminal." \
        "You're making progress!" \
        "Even Einstein made typos!" \
        "Your effort is commendable!" \
        "Take a deep breath, you're doing fine." \
        "That was just a warm-up." \
        "You're glowing with potential!" \
        "This mistake will lead to greatness!" \
        "You're a coding angel!" \
        "You're doing divine work!" \
        "The terminal loves you." \
        "Your passion shows!" \
        "You just made the terminal 10x more beautiful!" \
        "You are made of stardust and perseverance." \
        "Nice try! You're getting there!" \
        "You bring light to this shell session." \
        "The command line forgives you." \
        "Your fingers are dancing with learning." \
        "I admire your persistence!" \
        "Let’s chalk that up to creative exploration." \
        "You're clearly thinking outside the box!" \
        "You’re the reason the stars shine a little brighter." \
        "Oops? More like a learning opportunity!" \
        "You're one command away from brilliance!" \
        "The code gods smile upon you." \
        "A little mistake won't stop your greatness." \
        "Happy accidents make brilliant minds." \
        "You're crafting magic, one typo at a time." \
        "This is how legends are born!" \
        "You have such a wonderful spirit." \
        "Bless your heart and your command line!" \
        "You're radiant with potential!" \
        "Oopsie-daisy! You're still wonderful." \
        "Your terminal glows with grace." \
        "That wasn’t wrong, it was avant-garde!" \
        "The terminal just smiled at you." \
        "You’re like a unicorn among mere mortals." \
        "You radiate positivity, even with typos!" \
        "The world is better with you in it." \
        "Keep typing — the magic is unfolding." \
        "Look at you go! Truly inspirational." \
        "You’re a force of nature (a kind one)!" \
        "Not a mistake — a plot twist!" \
        "This terminal is proud of you!" \
        "You're enchanting the shell with your presence." \
        "The universe believes in you. So do I!" \
        "A small typo can’t hide your greatness." \
        "This was just a test. You passed — in heart!" \
        "Even in error, your intent shines bright." \
        "You're building your story, command by command." \
        "Think of this as a moment of growth." \
        "Grace in the face of error. You're awesome." \
        "You're learning. That's heroic." \
        "You inspire even the most rigid syntax." \
        "Oops! That’s just another step toward mastery." \
        "You're not lost — you’re exploring." \
        "Wrong command, right attitude!" \
        "You've already won — you're trying!" \
        "Little mistake, big heart." \
        "The angel of the terminal watches over you." \
        "You're not wrong, you're just early to the future." \
        "The best coders laugh at their errors. You’re the best."

    set RANDOM (random)

    test -n "$COMMENT_FREQ" && set freq $COMMENT_FREQ
    test -n "$CMD_NOT_FOUND_MSGS" && set messages $CMD_NOT_FOUND_MSGS
    test -n "$CMD_NOT_FOUND_MSGS_APPEND" && set -a messages $CMD_NOT_FOUND_MSGS_APPEND

    test -n "$COMMENT_COLOR" && set color $COMMENT_COLOR
    if [ $color = 0 ];
        set color (random 1 255)
    end

    if test (math $RANDOM % 10) -lt $freq;
        set message $messages[(math \( $RANDOM % (count $messages) \) + 1)]
        printf "\\n  %s\\n\\n" "$(tput bold)$(tput setaf $color)$message$(tput sgr0)" >&2
    end
end
