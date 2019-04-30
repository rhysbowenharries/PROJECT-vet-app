require_relative('../models/vet')
require_relative('../models/animal')

vet1 = Vet.new({'name' => 'Arnold Anderson'})
vet2 = Vet.new({'name' => 'Bernard Bond'})
vet3 = Vet.new({'name' => 'Catherine Constantine'})
vet4 = Vet.new({'name' => 'David Davis'})

vet1.save
vet2.save
vet3.save
vet4.save

animal1 = Animal.new({
  'name' => 'Alfonso',
  'stardate_of_birth' => '1st of Jan 1990',
  'type_of_animal' => 'aligator',
  'owner_information' => 'Human',
  'treatment_notes' => 'Chronic constipation from eating too many Fernagons',
  'vet_tag' => vet1.id })

animal2 = Animal.new({
  'name' => 'Benito',
  'stardate_of_birth' => 'X90 3.5 GammaGamma',
  'type_of_animal' => 'Fernagon',
  'owner_information' => 'Gasseous Gogonite',
  'treatment_notes' => 'Countless venerial disseases',
  'vet_tag' => vet2.id })

  animal3 = Animal.new({
    'name' => 'Squibulous',
    'stardate_of_birth' => '1011100011001',
    'type_of_animal' => 'Boonakniner',
    'owner_information' => 'Bohemasaur',
    'treatment_notes' => 'High blood pressure',
    'vet_tag' => vet3.id })

  animal4 = Animal.new({
    'name' => 'Jack',
    'stardate_of_birth' => '22nd of Terra NW19',
    'type_of_animal' => 'Minature Rino',
    'owner_information' => 'Humo-Martian',
    'treatment_notes' => 'Type 2 Clones dissease',
    'vet_tag' => vet3.id })

  animal5 = Animal.new({
    'name' => 'Michadoookadoookadooka',
    'stardate_of_birth' => 'm126',
    'type_of_animal' => 'Quirkle',
    'owner_information' => 'Dukanoid',
    'treatment_notes' => 'Still has baby teeth',
    'vet_tag' => vet4.id })

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save
