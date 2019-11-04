class AiSetter
    attr_reader :code
    
    def initialize 
        @code = []
        @feedback = []
        set_code
        @players_guess = nil
    end

    def check_this_guess(players_guess)#array => [1,2,3,4]
        @feedback.clear
        @players_guess = players_guess
        @players_guess.each_with_index do |number , index|
            case @code.include? number
            when true 
                @feedback << :green if index == @code.index(number)
                @feedback <<  :blue if index != @code.index(number)
            when false 
                @feedback << :red
            end
        end
        @feedback
    end 

    def code_cracked?
        @players_guess == @code
    end

    private
    def set_code
        until @code.length == 4
            random_number = rand(9)+1
            @code << random_number unless @code.include? random_number
        end
    end

end