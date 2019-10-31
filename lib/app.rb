require './master_box.rb'

class MasterMindApp < Sinatra::Base
    set :root, 'lib/app'
    enable :sessions
    configure :development do 
        register Sinatra::Reloader
    end
    get '/' do 
        session.clear
        local_vars = {  
            title: Instructions.title, 
            instructions: Instructions.instructions.split(".").map!(&:strip),
            hints: Instructions.hints.split(".").map!(&:strip),
            example: Instructions.example.split(".").map!(&:strip)
        }
        erb :instructions, locals: {vars: local_vars}
    end

    get "/play" do 
        session[:ai] ||= AiSetter.new
        session[:results] ||= false
        if session[:results]
            session[:limit] ||= 0
            session[:limit] += 1
            if session[:limit] >= 6
                session.clear 
                redirect '/'
            end
            results = session[:results]
            erb :play_game, locals: {results: results}
        else
            erb :play_game, locals: {results: false}   
        end
    end

    post "/check" do
        human_guess = params[:guess].split('').map(&:to_i)
        session[:results] = {
            visual: session[:ai].check_guess(human_guess),
            winner: session[:ai].code_cracked?, 
            previous_guess: human_guess
        }
        redirect "/play"
    end

    get '/against_ai' do 
        "AI playing against you"
    end
end