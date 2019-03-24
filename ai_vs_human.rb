require "./human_code_maker.rb"
require "./ai_code_breaker.rb"

module AiVsHuman

    def play_game
        $human = HumanCodeMaker.new
        $ai = AiCodeBreaker.new 

        for i in 0..6 
            puts "AI is thinking..."
            sleep 2.5
            puts "ai guess is #{$ai.code}"
            ai_guess_results = $human.let_ai_guess $ai.code
            if $ai.code == $human.code
                puts "The computer figured out your code."
                break
            end
            $ai.generate_code ai_guess_results
            sleep 2
        end
    end

end