class Instructions
    def self.title
        "Welcome to Mastermind!"
    end

    def self.instructions
        "You have 6 attempts to guess the 4 digit code that the computer has generated. The code contains the numbers 0-9. After each attempt you will receive some feedback on your guess."
    end
     
    def self.hints
        "Feedback: A green number indicates a correct number in the correct spot - you're going to want to guess this number again in the same spot. A blue number indicates a correct number in the wrong spot - guess this number again but in a different spot. A red number indicates that the number is not in the code - dont guess this number again!"
    end

    def self.example
        "For example, say the secret code is 1234 and you guessed 5261. As a result you would see .5.2.6.1"
    end
end