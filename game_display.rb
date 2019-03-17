module GameDisplay
    def intro
        puts `clear`
        puts "Welcome to Mastermind!\n".center(100) 
        puts "\n\t 1) The object of the game is to guess a 4 digit secret code that the computer has generated.\n"
        puts "\n\t 2) You only have 6 attempts to break the code.\n"
        puts "\n\t 3) The computer will provide feedback to you after each guess.\n"
        puts "\n\t#{"HINTS".colorize(:light_magenta)}:"
        puts "\t\tA #{"red".colorize(:red)} number indicates the number is a correct guess in the correct spot."
        puts "\t\tA #{"green".colorize(:green)} number indicates a correct guess in the wrong spot."
        puts "\t\tA #{"blue".colorize(:light_cyan)} number indicates a wrong guess.\n"
        puts "\n\t #{"For example:".colorize(:light_cyan)} The secret code is 1234. Your guess is 5261. You would see #{5.to_s.colorize(:light_cyan)}#{2.to_s.colorize(:red)}#{6.to_s.colorize(:light_cyan)}#{1.to_s.colorize(:green)}\n"
    end

end