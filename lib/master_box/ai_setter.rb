class AiSetter
    # attr_accessor :computer_code
    def initialize 
        @computer_code = []
        @results = []
        set_code
        @players_guess = nil
    end

    def check_guess(players_guess)#array
        @results.clear
        @players_guess = players_guess
        @players_guess.each_with_index do |number , index|
            case @computer_code.include? number
            when true 
                @results << :green if index == @computer_code.index(number)
                @results <<  :blue if index != @computer_code.index(number)
            when false 
                @results << :red
            end
        end
        @results.map!(&:to_s)
    end 

    def code_cracked?
        @players_guess == @computer_code
    end

    private
    def set_code
        until @computer_code.length == 4
            random_number = rand(9)+1
            @computer_code << random_number unless @computer_code.include? random_number
        end
    end

end