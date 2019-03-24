class HumanCodeMaker 
    
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
        @results
    end

    private
    def set_code
        puts "What is your secret code?"
        @code = gets.chomp[0..3].split('').map! {|str| str.to_i }
    end
end