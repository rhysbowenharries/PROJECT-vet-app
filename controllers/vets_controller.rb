require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/vet')
require('pry')

get '/great-dane' do
  @vets = Vet.all
  erb(:"vets/index")
end

get '/great-dane/new' do
  erb(:"vets/new")
end

get '/great-dane/:id' do
  @vet = Vet.find(params[:id])
  @patients = Animal.find_by_vet_tag(params[:id])
  erb(:"vets/show")
end

post '/great-dane' do
  @vet = Vet.new(params)
  @vet.save
  erb(:"vets/create")
end

get '/great-dane/:id/edit' do
  @vet = Vet.find(params[:id])
  erb(:"vets/edit")
end

post '/great-dane/:id' do
  Vet.new(params).update
  redirect to '/great-dane'
end

post '/great-dane/:id/delete' do
  vet = Vet.find(params[:id])
  vet.delete
  erb(:"vets/delete")
end
