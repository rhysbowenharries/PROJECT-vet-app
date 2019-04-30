require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/vet')
also_reload('models/*')


# index
get '/great-dane' do
  @vets = Vet.all
  erb(:"vets/index")
end


# new
get '/great-dane/new' do
  erb(:"vets/new")
end


#show
get '/great-dane/:id' do
  @vet = Vet.find(params[:id])
  erb(:"vets/show")
end

#create
post '/great-dane' do
  @vet = Vet.new(params)
  @vet.save
  erb(:"vets/create")
end

# edit
get '/great-dane/:id/edit' do
  @vet = Vet.find(params[:id])
  erb(:"vets/edit")
end

#UPDATE

post '/great-dane/:id' do
  Vet.new(params).update
  redirect to '/great-dane'
end

#delete
post '/great-dane/:id/delete' do
  vet = Vet.find(params[:id])
  vet.delete
  erb(:"vets/delete")
end

#animals index
get '/lesser-danes' do
  @animals = Animal.all
  erb(:"animals/index")
end

#animals new
get '/lesser-danes/new' do
  @vets = Vet.all
  erb(:"animals/new")
end

# annimals show

get '/lesser-danes/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

#animal CREATE
post '/lesser-danes' do
  @animal = Animal.new(params)
  @animal.save
  erb(:"animals/create")
end

#animl Edit

get '/lesser-danes/:id/edit' do
  @vets = Vet.all
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

#animal update
post '/lesser-danes/:id' do
  Animal.new(params).update
  erb(:"animals/update")
end

#ANIMAL DELETE

post '/lesser-danes/:id/delete' do
  Animal.find(params[:id]).delete
  erb(:"animals/delete")
end
