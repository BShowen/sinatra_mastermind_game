require "colorize"
require "./custom_enumerable.rb"
module CodeSetters

    class HumanCodeSetter
        
        attr_reader :code

        def initialize
            @code = []
            @code_break_attempt = []
            set_code
        end

        def let_ai_guess ai_guess
            @results = []
            ai_guess.each_with_index do |number, index| 
                case @code[index] == number 
                when true
                    @results << true
                when false
                    if @code.include? number 
                        @results << 'almost'
                    else
                        @results << false
                    end
                end
            end
            display_colored_results ai_guess, @results
            @results
        end

        def display_colored_results ai_guess, results
            @colored_display = []
            results.each_with_index do |item, index|
                case item
                when true
                    @colored_display << ai_guess[index].to_s.colorize(:red)
                when false
                    @colored_display << ai_guess[index].to_s.colorize(:light_cyan)
                when 'almost'
                    @colored_display << ai_guess[index].to_s.colorize(:green)
                end
            end
            puts "AI guess is #{@colored_display.join('')}"
        end

        private
        def set_code
            puts "What is your secret code?"
            begin
                @code = gets.chomp[0..3].split('').map! {|str| str.to_i } 
                raise if @code.has_doubles?
            rescue
                puts "You cant have duplicate numbers in your code.\nTry again."
                retry
            end
        end
    end

    

    class AiCodeSetter
        # attr_accessor :computer_code
        def initialize 
            @computer_code = []
            @code_break_attempt = []
            set_code
        end

        def let_human_guess players_guess#array
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
            @code_break_attempt.join
        end 

        def code_cracked? players_guess
            players_guess == @computer_code
        end

        private
        def set_code
            until @computer_code.length == 4
                random_number = rand(9)+1
                @computer_code << random_number unless @computer_code.include? random_number
            end
        end

    end
    
end