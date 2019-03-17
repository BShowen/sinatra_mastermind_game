require './player.rb'
require './computer.rb'
require './game_display.rb'
include GameDisplay

def is_game_over
    if $computer.cracked? $player.guess
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
        exit
    end
end

def play_game
    GameDisplay::intro
    $computer = Computer.new
    $player = Player.new 
    for i in 1..6 do 
        puts "\nAttempt number #{i}"
        $player.make_guess
        $computer.attempt_to_crack_code $player.guess
        break if $computer.cracked? $player.guess
    end
end

play_game
is_game_over