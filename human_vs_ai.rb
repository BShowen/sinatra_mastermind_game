require './human_code_breaker.rb'
require './ai_code_maker.rb'

module HumanVsAi

    def is_game_over
        if $ai.code_cracked? $player.guess
            puts "you won!"
            play_again
        else
            puts "you lost!"
            play_again
        end
    end

    def play_again
        puts "Would you like to play again? (y/n)"
        reply = gets.chomp.upcase
        case reply
        when "Y"
            play_game
            is_game_over
        when "N"
            puts `clear`
            puts "Thanks for playing!"
            exit
        end
    end

    def play_game
        puts "\nAwesome, Lets play!"
        puts "\nThe computer has chosen their secret code."
        $ai = AiCodeMaker.new
        $player = HumanCodeBreaker.new 
        for i in 1..6 do 
            puts "\nAttempt number #{i}"
            $player.make_guess
            $ai.crack_code $player.guess
            if $ai.code_cracked? $player.guess
                puts "Nice job, you figured out the code!"
                break
            end
        end
    end

end