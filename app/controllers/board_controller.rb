class BoardController < ApplicationController 

    get '/boards' do 
        @boards= Board.all 
        erb :'boards/index'
    end 
   
    get '/boards/new' do 
        erb :'boards/create_board'
    end 
    
    get '/boards/:id' do 
        @boards = Board.find(params[:id])
        erb :'boards/show_board'
      end 

    post '/boards' do 
        board = Board.create(name: params[:board][:name], description: params[:board][:description])

        params[:board][:memories].each do |memory_info|
            memory = Memory.new(memory_info)
            memory.board = board
            memory.save
        end 
        redirect to "/boards/#{board.id}"
        # @memories = Memory.all
    end 

end 