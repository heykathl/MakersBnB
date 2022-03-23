CREATE TABLE requests (
  id SERIAL PRIMARY KEY, 
  confirmed boolean, 
  space_id INTEGER REFERENCES spaces(id),
  start_date DATE,
  end_date DATE,
  space_renter INTEGER REFERENCES Credentials(id)
);