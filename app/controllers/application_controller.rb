require 'rack-flash'
require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "add_encryption"
  end

  get '/' do
    @user = User.all
    @boards = Board.all
    erb :'users/create_user' 
  end


  helpers do 
    def current_user 
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] != nil
    end

    def logged_in?
      !!current_user
    end 

    def logout
      session.destroy
    end 

  end

end 

