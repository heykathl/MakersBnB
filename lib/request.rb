require 'pg'
require_relative 'user'
require_relative 'space'

class Request 

  attr_reader :id, :space_id, :start_date, :end_date, 
  :space_renter, :owner_id, :space_name

  def initialize(id:, space_id:, start_date:, end_date:, 
    space_renter:, owner_id:, space_name:)
    @id = id
    @space_id = space_id
    @start_date = start_date
    @end_date = end_date
    @space_renter = space_renter
    @owner_id = owner_id
    @space_name = space_name
  end

  def self.create(space_id:, start_date:, end_date:, space_renter:)
    db_env_connection


    joined_result = @@connection.exec_params(
      "SELECT *
      FROM Credentials 
      INNER JOIN spaces 
      ON Credentials.id = spaces.user_id
      WHERE spaces.id = $1
      ORDER BY spaces.id;", [space_id])
      
      "joined_result = #{joined_result}"

    @@owner_id = joined_result[0]['user_id']
    @@space_name = joined_result[0]['space_name']

    p @@space_name
    
    joined_result.map do |row|
      puts row
    end

    result = @@connection.exec(
      "INSERT INTO requests (space_id, start_date, end_date, space_renter, owner_id, space_name) 
      VALUES ('#{space_id}', '#{start_date}','#{end_date}', '#{space_renter}', '#{@@owner_id}', '#{@@space_name}') 
      RETURNING id, space_id, start_date, end_date, space_renter, space_name")
    result.map do |row|
      Request.new(
        id:result[0]['id'], 
        space_id:result[0]['space_id'], 
        start_date:result[0]['start_date'],
        end_date:result[0]['end_date'],
        space_renter:result[0]['space_renter'],
        owner_id:result[0]['owner_id'],
        space_name:result[0]['space_name']
        )
      end
  end

  def self.all
    db_env_connection

    result = @@connection.exec_params("SELECT * FROM requests")
    result.map do |row|
      Request.new(id: row['id'], space_id: row['space_id'], 
        start_date: row['start_date'], end_date: row['end_date'], 
        space_renter: row['space_renter'], owner_id: row['owner_id'], space_name: row['space_name']
        )
    end
  end

  def self.confirmed(space_id:)
    db_env_connection
    
    d1 = Date.parse(Request.start_date).to_date
    d2 = Date.parse(Request.end_date).to_date

    db_env_connection

    d1.upto(d2) do |date|
      @@connection.exec_params("DELETE FROM available_dates WHERE space_id = $1 AND available_dates = $2);", [space_id], [date])
    end

  end

  def self.space_name(space_id:)

    db_env_connection

    result = @@connection.exec_params("SELECT space_name FROM spaces WHERE id = $1;", [space_id])
    result[0]['space_name']
  end


  
  # Space.new(id: result[0]['id'], name: result[0]['space_name'], available_from: result[0]['available_from'], available_to: result[0]['available_to'], user_id: result[0]['user_id'])

  def self.db_env_connection

    if ENV['ENVIRONMENT'] == "test"
      @@connection = PG.connect(dbname: 'makersbnb_test')
    else
      @@connection = PG.connect(dbname: 'makersbnb')
    end

  end

end