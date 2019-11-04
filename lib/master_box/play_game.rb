require_relative "ai_guesser.rb"
require_relative "ai_setter.rb"
require_relative "human_guesser.rb"
require_relative "human_setter.rb"
class PlayGame

    def initialize(code_setter)
        @code_setter = code_setter.to_sym
        case @code_setter
        when :human
            @human = HumanSetter.new
            @ai = AiGuesser.new
        when :ai
            @human = HumanGuesser.new
            @ai = AiSetter.new
        end
    end

    def set_human_code(code)
        @human.set_code(code)
    end

    def attempt_guess
        case @code_setter
        when :human
            computer_guess_human_code
        when :ai
            human_guess_computer_code
        end
    end

    private 
    #code for human vs computer
    def human_guess_computer_code
        feedback = @ai.check_this_guess(@human.code)
        hash = {
            colors: feedback, 
            guess: @human.code,
            game_over: game_over?
        }
    end



    #code for computer vs human
    def computer_guess_human_code
        feedback = @human.check_this_guess(@ai.code)
        hash = {
            ai_guess: @ai.code,
            game_over: game_over?
        }
        @ai.new_guess(feedback)
        hash
    end

    def game_over?
        @human.code == @ai.code
    end 
end