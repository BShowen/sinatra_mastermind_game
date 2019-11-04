# require "./custom_enumerable.rb"

class HumanSetter
    attr_reader :code

    def initialize
        @code = []
    end

    def check_this_guess(opponents_guess)
        results = []
        opponents_guess.each_with_index do |number, index| 
            case @code[index] == number 
            when true
                results << :green
            when false
                if @code.include? number 
                    results << :blue
                else
                    results << :red
                end
            end
        end
        results
    end

    def set_code(code) #code is a string of numbers. e.g. '1234'
        code = code.split('').map!(&:to_i) #convert string code to array of numbers. 
        if code.has_doubles?
            false
        else 
            @code = code
            true
        end
    end
end