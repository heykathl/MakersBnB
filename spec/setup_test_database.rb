require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'makersbnb_test')

# Clear the Credentials table
  connection.exec("TRUNCATE Credentials, spaces, available_dates")

end
