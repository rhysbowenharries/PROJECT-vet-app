require_relative('../models/vet')
require ('pry')


vet1 = Vet.new({'name' => 'Arnold Anderson'})
vet2 = Vet.new({'name' => 'Bernard Bond'})
vet3 = Vet.new({'name' => 'Catherine Constantine'})
vet4 = Vet.new({'name' => 'David Davis'})

vet1.save
vet2.save
vet3.save
vet4.save


 binding.pry
 nil
