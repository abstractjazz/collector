class BoardController < ApplicationController 

    get '/boards' do 
        if logged_in?
            @boards = current_user.boards
        erb :'boards/index'
        else 
            redirect to '/login'
        end 
    end 
   
    get '/boards/new' do 
        if logged_in?
            erb :'boards/create_board'
        else 
            redirect to '/login'
        end
    end  
    
    post '/boards' do 
        if logged_in?
            if params[:board] == ""
                redirect to '/boards/new'
            else 
                @board = current_user.boards.new(name: params[:board][:name], description: params[:board][:description])
               
                params[:board][:memories].each do |memory_info|
            
                @memory = Memory.new(memory_info)
                @memory.board = @board
                @memory.save
              
                end 
                erb :'boards/show_board'
            end 
        else  
            redirect to '/login'
        end 
    end 

    get '/boards/:id' do 
        @board = Board.find_by_id(params[:id])        
        erb :'boards/show_board'
    end 

    get '/boards/:id/edit' do 
        if logged_in?
            @board = current_user.boards.find_by(id: params[:id])
            if @board && @board.user == current_user
                erb:'boards/edit_board'
            else 
            redirect to '/boards'
            end 
        else 
        redirect to '/login'
        end 
    end 

    patch '/boards/:id' do 
        
        if logged_in?
            if params[:board] == ""
                redirect to '/boards/#{params[:id]}/edit'
            else 
                @board = Board.find_by_id(params[:id]) 
                @board.update(name: params[:board][:name], description: params[:board][:description])  
                           
                params[:board][:memories].each do |memory_info|
                @memory = Memory.find_by_id(params[:id])
                @memory.update(memory_info)
                @memory.save
                @memory.board = @board
                redirect "/boards/#{@board.id}"
                end
            end    
        else 
            redirect to '/login' 
        end  
    end 

    delete '/boards/:id/delete' do 
        if logged_in?
            @board = Board.find_by_id(params[:id])
            if @board && @board.user == current_user
            @board.delete
            else 
            redirect to '/boards'
            end 
        else 
        redirect to '/login'
        end

    end          
end 