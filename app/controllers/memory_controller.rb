class MemoryController < ApplicationController 

  get '/memory' do
    @memories = Memory.all
    erb :'/memories/show_memory' 
  end

  post '/memory' do
  
    @memories = Memory.create(name: params[:name], description: params[:description], uploaded_memory: params[:uploaded_memory])

    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("./public/images/#{@filename}", 'wb') do |f|
      f.write(file.read)
      # binding.pry
    end
  
    erb :'memories/show_memories'
    end 
    # raise params.inspect
end