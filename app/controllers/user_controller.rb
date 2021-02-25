class UserController < ApplicationController 

   get 'users/:slug' do 
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
   end 

    get '/signup' do 
        if !is_logged_in?
            erb :'users/login'
        else 
            redirect '/boards'
        end 
    end 

    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else 
            @user = User.new(params[:user])
            @user.save
            session[:user_id] = @user.id 
            redirect to '/boards' 
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
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/posts'
        else 
            flash[:error] = "Can't find that username and/or password. Have you already signed up?"
            redirect to '/signup'
        end
    end 

    get '/logout' do 
        if logged_in?
            session.destroy
            redirect to '/login'
        else 
            redirect to '/'
        end 
    end 
end