CREATE TABLE spaces(
  id SERIAL PRIMARY KEY, 
  space_name VARCHAR(180), 
  description VARCHAR(200), 
  price_per_night INT, 
  available_from DATE, 
  available_to DATE, 
  user_id INTEGER REFERENCES Credentials(id)
  ); 

CREATE TABLE available_dates(
  id SERIAL PRIMARY KEY, 
  space_id INTEGER REFERENCES spaces(id), 
  available_dates DATE
  );