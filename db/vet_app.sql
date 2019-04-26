DROP TABLE animals;
DROP TABLE vets;

CREATE TABLE vets (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 primary key,
  name VARCHAR(255),
  Stardate_of_birth VARCHAR(255),
  Type_of_Animal VARCHAR(255),
  Owner_information VARCHAR(255),
  Treatment_Notes VARCHAR(255),
  vet_tag INT8 REFERENCES vets(id)
);
