require "./code_guessers.rb"
require "./code_setters.rb"
require "./instructions.rb"

Instructions::intro 

def play_game_against who
    case who
    when 'ai'  # Human guesses AI code.
        $ai = CodeSetters::AiCodeSetter.new 
        $human = CodeGuessers::HumanCodeGuesser.new 
        puts "\nAwesome, Lets play!"
        puts "\nThe computer has chosen their secret code."
        for i in 1..6 
            puts "\nAttempt number #{i}"
            $human.guess
            $human.code
            puts $ai.let_human_guess $human.code
            if $ai.code_cracked? $human.code
                puts "Nice job, you figured out the code!"
                break
            elsif i == 6
                puts "You lost."
            end
        end
        play_again
    when 'human' # Ai guesses Human code.
        $human = CodeSetters::HumanCodeSetter.new
        $ai = CodeGuessers::AiCodeGuesser.new
        for i in 0..6 
            puts "Let me think.."
            sleep 1.5
            ai_guess_results = $human.let_ai_guess $ai.code
            if $ai.code == $human.code
                puts "The computer figured out your code."
                break
            end
            $ai.generate_code ai_guess_results
            sleep 2
        end
        play_again
    end
end

    
def play_again
    puts "Would you like to play again? (y/n)"
    reply = gets.chomp.upcase
    puts "reply is #{reply}"
    case reply
    when "Y"
        get_game_parameters_from_user
        play_again
    when "N"
        puts `clear`
        puts "Thanks for playing!"
        exit
    end
end

def get_game_parameters_from_user
    puts "\nDo you want to guess the code or create the code?"
    puts "\nPress 1 to guess the code.\nPress 2 to create the code."
    begin
        reply = gets.chomp[0].match(/[1-2]/)[0]
    rescue
        puts "Invalid response. Try again."
        retry 
    end

    case reply.to_i
    when 1
        play_game_against "ai"
    when 2 
        play_game_against "human"
    end
end

get_game_parameters_from_user