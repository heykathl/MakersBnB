require_relative 'user'
require 'date'

class Space

  attr_reader :id, :name, :available_from, :available_to, :user_id

  def initialize(id:, name:, available_from:, available_to:, user_id:)
    @id = id
    @name = name
    @available_from = available_from
    @available_to = available_to
    @user_id = user_id
  end

  def self.create(name:, description:, price_per_night:, available_from:, available_to:, email:)

    user = User.find(email)
    user_id = user.id

    d1 = Date.parse(available_from).to_date
    d2 = Date.parse(available_to).to_date

    db_env_connection

    result = @@connection.exec_params("INSERT INTO spaces (space_name, description, price_per_night, available_from, available_to, user_id) VALUES($1, $2, $3, $4, $5, $6) RETURNING id, space_name, available_from, available_to, user_id;",
      [name, description, price_per_night, available_from, available_to, user_id])

      d1.upto(d2) do |date|
        @@connection.exec_params("INSERT INTO available_dates (space_id, available_dates) VALUES ($1, $2);", [result[0]['id'], date])
      end

    Space.new(id: result[0]['id'], name: result[0]['space_name'], available_from: result[0]['available_from'], available_to: result[0]['available_to'], user_id: result[0]['user_id'])

  end

  def self.all
    db_env_connection

    result = @@connection.exec_params("SELECT space_name, description, available_from, available_to FROM spaces")
  end

  def self.find
    db_env_connection
    
    result = @@connection.exec_params("SELECT * FROM available_dates INNER JOIN spaces ON available_dates.space_id = spaces.id ORDER BY space_id;")

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