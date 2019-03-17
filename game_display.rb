module GameDisplay
    def intro
        puts "Welcome to Mastermind!\nThe object of the game is to guess a secret code that the computer has generated.\nThe code is only 4 digits long and consists only of numbers. You will have 6 attempts to break the code.\nIf you are unable to guess the code in under 6 attempts then you lose\nThe computer will provide feedback to you after each guess."
        puts "A #{"red".colorize(:red)} number indicates the number is a correct guess in the correct spot.\nA #{"green".colorize(:green)} number indicates a correct guess in the wrong spot\nA #{"blue".colorize(:light_cyan)} color indicates a wrong guess."
        puts "For example, if the secret code is 1234 and your guess is 5261 you would see \n#{5.to_s.colorize(:light_cyan)}#{2.to_s.colorize(:red)}#{6.to_s.colorize(:light_cyan)}#{1.to_s.colorize(:green)}"
    end

end