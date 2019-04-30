DROP TABLE animals;
DROP TABLE vets;

CREATE TABLE vets (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 primary key,
  name VARCHAR(255),
  stardate_of_birth VARCHAR(255),
  type_of_animal VARCHAR(255),
  owner_information VARCHAR(255),
  treatment_notes VARCHAR(255),
  vet_tag INT8 REFERENCES vets(id) ON DELETE CASCADE
);
