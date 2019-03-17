class Player
    
    attr_reader :guess 
    
    def initialize
        @guess = []
    end

    def make_guess
        @guess = gets.chomp.split('').map! { |i| i.to_i }
    end

end