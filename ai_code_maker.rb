require 'colorize'

class AiCodeMaker
    attr_accessor :code
    def initialize 
        @computer_code = []
        @code_break_attempt = []
        generate_random_code
    end

    def attempt_to_crack_code players_guess #array
        @code_break_attempt.clear
        players_guess.each_with_index do |number , index|
            case @computer_code.include? number
            when true 
                @code_break_attempt << number.to_s.colorize(:red) if index == @computer_code.index(number)
                @code_break_attempt <<  number.to_s.colorize(:green) if index != @computer_code.index(number)
            when false 
                @code_break_attempt << number.to_s.colorize(:light_cyan)    
            end
        end
        puts @code_break_attempt.join()
    end 

    def code_cracked? players_guess
        players_guess == @computer_code
    end

    private
    def generate_random_code
        until @computer_code.length == 4
            random_number = rand(9)+1
            @computer_code << random_number unless @computer_code.include? random_number
        end
    end

end