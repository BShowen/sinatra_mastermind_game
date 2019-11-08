class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'lib/app/views'
        set :public_dir, 'lib/public/stylesheets'
        enable :sessions
        # register Sinatra::CSS
    end

    configure :development do 
        register Sinatra::Reloader
    end

    get '/' do 
        @stylesheet = "index.css"
        session.clear
        $game = nil
        locals = {  
            title: Instructions.title, 
            instructions: Instructions.instructions,
            hints: Instructions.hints,
            example: Instructions.example.split(".").map!(&:strip)
        }
        erb :index, locals: {hash: locals}
    end

    get '/play/:setter' do |setter|
        @stylesheet = 'play_game.css'
        $game ||= PlayGame.new(setter)
        erb :play_game, locals: {code_setter: setter, feedback: {game_over: false, colors: false}}
    end

    post '/set_code' do 
        $game.set_human_code(params[:code])
        redirect 'ai/guess'
    end

    get '/ai/guess' do
        @stylesheet = "play_game.css"
        erb :computer_guess, locals: {game: $game}
    end

    post '/guess_code' do 
        @stylesheet = "play_game.css"
        $game.set_human_code(params[:code])
        feedback = $game.attempt_guess
        erb :play_game, locals: {code_setter: "ai", feedback: feedback}
    end 
end