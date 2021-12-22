CREATE TABLE complex (
  name_complex VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
  city VARCHAR(50)
);

CREATE TABLE room (
 num_room INTEGER PRIMARY KEY UNIQUE NOT NULL,
 num_seat INTEGER,
 complex VARCHAR REFERENCES complex (name_complex)
);


CREATE TABLE movie(
  name_movie VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
  start_hours TIMESTAMP NOT NULL UNIQUE,
  complex VARCHAR REFERENCES complex (name_complex),
  num_room INTEGER REFERENCES room (num_room)
);

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  price NUMERIC,
  type_ticket VARCHAR(50),
  complex VARCHAR REFERENCES complex (name_complex),
  num_room INTEGER REFERENCES room (num_room),
  name_movie VARCHAR REFERENCES movie (name_movie),
  start_hours TIMESTAMP REFERENCES movie (start_hours)
);

CREATE TABLE guest (
  lastname VARCHAR(50) NOT NULL,
  firstname VARCHAR(50) NOT NULL
);

CREATE TABLE manager (
  id SERIAL PRIMARY KEY,
  lastname VARCHAR(50) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  complex VARCHAR REFERENCES complex (name_complex)
);

INSERT INTO complex (name_complex, city) VALUES 
('MégaPlex','Paris');

INSERT INTO complex (name_complex, city) VALUES 
('CinéPixel','Lyon');

INSERT INTO room (num_room, num_seat, complex) VALUES 
(14, 56, 'MégaPlex');

INSERT INTO room (num_room, num_seat, complex) VALUES  
(12, 54, 'CinéPixel');

INSERT INTO movie (name_movie, start_hours, complex, num_room) VALUES 
('Matrix', '2021-12-20 14:30:00', 'MégaPlex', 14);

INSERT INTO movie (name_movie, start_hours, complex, num_room) VALUES 
('Nemo', '2021-12-20 15:30:00', 'CinéPixel', 12);

INSERT INTO ticket (price, type_ticket,complex, num_room, name_movie, start_hours) VALUES 
(9.20, 'Etudiant', 'MégaPlex', 14, 'Matrix','2021-12-20 14:30:00');

INSERT INTO ticket (price, type_ticket,complex, num_room, name_movie, start_hours) VALUES 
(5.90, 'Moins de 14 ans', 'CinéPixel', 12, 'Nemo', '2021-12-20 15:30:00');

INSERT INTO guest (lastname, firstname) VALUES 
('Vanez', 'Paul');

INSERT INTO guest (lastname, firstname) VALUES 
( 'Dubois', 'Vanessa');

INSERT INTO manager (lastname, firstname, complex) VALUES 
( 'Roux', 'Elodie', 'MégaPlex');

INSERT INTO manager (lastname, firstname, complex) VALUES 
( 'Parko', 'Will', 'CinéPixel');