require 'colorize'

module Instructions
    def Instructions.intro
        puts `clear`
        puts "Welcome to Mastermind!".center(100) 
        puts "\n\t 1) The object of the game is to guess a 4 digit secret code that the computer has generated."
        sleep 1
        puts "\n\t 2) You only have 6 attempts to break the code."
        sleep 1
        puts "\n\t 3) The computer will provide feedback to you after each guess."
        sleep 1
        puts "\n\t 4) The code will only contain numbers 0-9 and never any duplicate numbers."

        puts "\n\t#{"HINTS".colorize(:light_magenta)}:"
        sleep 0.5
        puts "\t\tA #{"red".colorize(:red)} number indicates a correct guess in the correct spot."
        sleep 0.5
        puts "\t\tA #{"green".colorize(:green)} number indicates a correct guess in the wrong spot."
        sleep 0.5
        puts "\t\tA #{"blue".colorize(:light_cyan)} number indicates a wrong guess."
        sleep 2
        puts "\n\t #{"EXAMPLE:".colorize(:light_magenta)} The secret code is 1234\n\t\t       Your guess is 5261\n\t\t       You would see #{5.to_s.colorize(:light_cyan)}#{2.to_s.colorize(:red)}#{6.to_s.colorize(:light_cyan)}#{1.to_s.colorize(:green)}"
    end
end