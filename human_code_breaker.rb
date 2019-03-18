class HumanCodeBreaker
    
    attr_reader :guess 
    
    def initialize
        @guess = []
    end

    def make_guess
        puts "What is your guess?"
        @guess.clear
        @guess = gets.chomp.split('').map! { |str| str.to_i }
    end

end