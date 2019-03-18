require 'colorize'

class CodeMaker
    
    # attr_reader :code_maker_code

    def initialize
        @code_maker_code = []
        set_code
    end

    private

    def set_code
        puts "What is your secret code?"
        @code_maker_code = gets.chomp.split('').map! {|str| str.to_i }
    end

end