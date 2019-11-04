# require './master_box.rb'

class ApplicationController < Sinatra::Base
    configure do 
        set :root, 'lib/app'
        set :views, 'lib/app/views'
        set :public_dir, 'lib/app/public'
        enable :sessions
    end

    configure :development do 
        register Sinatra::Reloader
    end

    get '/' do 
        session.clear
        $game = nil
        locals = {  
            title: Instructions.title, 
            instructions: Instructions.instructions.split(".").map!(&:strip),
            hints: Instructions.hints.split(".").map!(&:strip),
            example: Instructions.example.split(".").map!(&:strip)
        }
        erb :index, locals: {hash: locals}
    end

    get '/play/:setter' do |setter|
        $game ||= PlayGame.new(setter)
        erb :play_game, locals: {code_setter: setter, feedback: false}
    end

    post '/set_code' do 
        $game.set_human_code(params[:code])
        redirect 'ai/guess'
    end

    get '/ai/guess' do
        erb :computer_guess, locals: {game: $game}
    end

    post '/guess_code' do 
        $game.set_human_code(params[:code])
        feedback = $game.attempt_guess
        erb :play_game, locals: {code_setter: "ai", feedback: feedback}
    end 
end