require "./config/environment"
require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do

  end

  get '/recipes' do
  	#binding.pry
  	@recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
      @recipe = Recipe.new(:id => params[:id], :name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
      @recipe.save

      redirect '/recipes/#{@recipe.id}'
  end


  get '/recipes/new' do
  	erb :new
  end


  get '/recipes/:id' do
  	@recipe = Recipe.find_by(:id => params[:id])
  	erb :show
  end

  get '/recipes/:id/edit' do
  	@recipes = Recipe.find_by(:id => params[:id])
  	erb :edit
  end

  



  
end
