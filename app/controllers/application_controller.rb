require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/board' do
    
    erb :'users/new'
  end 

  get '/image' do
    @memories = Memory.all
    erb :'users/show_image'
  end

  post '/image' do
  
 @memories = Memory.create(name: params[:name], description: params[:description], uploaded_memory: params[:uploaded_memory])

  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/images/#{@filename}", 'wb') do |f|
    f.write(file.read)
    # binding.pry
  end
  
 
    # binding.pry
    erb :'users/show_image'
    # raise params.inspect
end
end


