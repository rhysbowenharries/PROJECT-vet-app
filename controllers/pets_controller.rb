require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/vet')
also_reload('../models/*')

get '/lesser-danes' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/lesser-danes/new' do
  @vets = Vet.all
  erb(:"animals/new")
end

get '/lesser-danes/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

post '/lesser-danes' do
  @animal = Animal.new(params)
  @animal.save
  erb(:"animals/create")
end

get '/lesser-danes/:id/edit' do
  @vets = Vet.all
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/lesser-danes/:id' do
  Animal.new(params).update
  erb(:"animals/update")
end

post '/lesser-danes/:id/delete' do
  Animal.find(params[:id]).delete
  erb(:"animals/delete")
end
