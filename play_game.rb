require "./ai_vs_human.rb"
require "./human_vs_ai.rb"
require "./game_display.rb"
include GameDisplay

GameDisplay::intro
reply = gets.chomp.to_i
if reply == 1
    include HumanVsAi
    play_game
    play_again
else
    include AiVsHuman
    play_game
end