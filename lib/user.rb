require 'pg'
require 'bcrypt'

class User
  def self.create(email:, password:)

    encrypted_password = BCrypt::Password.create(password)

    db_env_connection

    result = @@connection.exec_params("INSERT INTO Credentials (email_address, password) VALUES($1, $2) RETURNING id, email_address;", [email, encrypted_password])
    User.new(id: result[0]['id'], email: result[0]['email_address'])

  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  private

  def self.db_env_connection

    if ENV['ENVIRONMENT'] == "test"
      @@connection = PG.connect(dbname: 'makersbnb_test')
    else
      @@connection = PG.connect(dbname: 'makersbnb')
    end

  end

end