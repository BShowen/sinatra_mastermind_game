class Instructions
    def self.title
        "Welcome to Mastermind!"
    end

    def self.instructions
        "1) The object of the game is to guess a 4 digit secret code that the computer has generated. 2) You only have 6 attempts to break the code. 3) The computer will provide feedback to you after each guess. 4) The code will only contain numbers 0-9 and never any duplicate numbers."
    end
     
    def self.hints
        "HINTS"
        "A red number indicates a correct guess in the correct spot. A green number indicates a correct guess in the wrong spot. A blue number indicates a wrong guess."
    end

    def self.example
        "For example, say the secret code is 1234 and you guessed 5261. As a result you would see .5.2.6.1"
        #5 is blue, 2 is red, 6 is blue, 1 is green
    end
end