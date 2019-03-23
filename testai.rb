require "./human_code_maker.rb"
require "./ai_code_breaker.rb"
# include GameDisplay

def play_game
    $human = HumanCodeMaker.new
    $ai = AiCodeBreaker.new 

    for i in 1..10 
        puts "ROUND #{i}"
        puts "ai guess is #{$ai.code}"
        ai_guess_results = $human.let_ai_attempt $ai.code
        break if $ai.code == $human.code
        $ai.generate_code ai_guess_results
        sleep 3
    end
end

play_game