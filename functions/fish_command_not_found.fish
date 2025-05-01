function fish_command_not_found
    __fish_angel_print_message
    printf (_ "fish: Unknown command: %s\n") (string escape -- $argv[1]) >&2
end
