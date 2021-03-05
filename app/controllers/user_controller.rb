class UserController < ApplicationController 

   get 'users/:slug' do 
    @user = User.find_by_slug(params[:slug])
    erb :'users/show_user'
   end 

    get '/signup' do 
        @user = User.all
        @boards = Board.all
       
        if !logged_in?
            erb :'users/create_user'
        else 
            redirect to '/boards'
        end 
    end 

    post '/signup' do 
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
       
        if @user.save
            session[:user_id] = @user.id
            redirect to '/boards/new'
        else 
            @user = User.all
            @boards = Board.all
            flash[:message] = "You might have got something wrong or chosen a username that already exists. Give it another shot!"
            erb :'users/create_user' 
        end 
    end 
    
    get '/login' do 

        if !logged_in?
            erb :'users/login'
        else 
            redirect to '/boards'
        end 
    end 
    
    post '/login' do 
        @user = User.find_by(username: params[:username])
       
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/boards'
        else 
            @user = User.all
            @boards = Board.all
            flash[:message] = "Can't seem to find that user. Have you already signed up?"
            erb :'users/create_user'
        end
    end 

    get '/logout' do 
        if logged_in?
            logout
            redirect to '/login'
        else 
            redirect to '/'
        end 
    end 
end