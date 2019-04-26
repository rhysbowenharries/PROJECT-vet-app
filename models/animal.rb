require_relative('../db/sql_runner')

class Animal

  attr_accessor :name, :stardate_of_birth, :type_of_animal, :owner_information, :treatment_notes, :vet_tag
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @stardate_of_birth = options['stardate_of_birth']
    @type_of_animal = options['type_of_animal']
    @owner_information = options['owner_information']
    @treatment_notes = options['treatment_notes']
    @vet_tag = options['vet_tag'].to_i
  end

  def save()
    sql = "INSERT INTO animals
      (
        name,
        stardate_of_birth,
        type_of_animal,
        owner_information,
        treatment_notes,
        vet_tag
      )
        VALUES
      (
        $1,$2,$3,$4,$5,$6
      )
      RETURNING id"
      values = [@name, @stardate_of_birth, @type_of_animal, @owner_information, @treatment_notes, @vet_tag]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
  end

  def update
    sql = "UPDATE animals
    SET
    (
      name,
      stardate_of_birth,
      type_of_animal,
      owner_information,
      treatment_notes,
      vet_tag
    )
      VALUES
    (
      $1,$2,$3,$4,$5,$6
    )
    WHERE id = $7"
    values = [@name, @stardate_of_birth, @type_of_animal, @owner_information, @treatment_notes, @vet_tag, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    animal = Animal.new(result)
    return animal
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal)}
  end

end
