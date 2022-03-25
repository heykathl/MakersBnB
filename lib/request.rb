require 'pg'
require_relative 'user'
require_relative 'space'

class Request 

  attr_reader :id, :space_id, :start_date, :end_date, 
  :space_renter

  def initialize(id:, space_id:, start_date:, end_date:, 
    space_renter:)
    @id = id
    @space_id = space_id
    @start_date = start_date
    @end_date = end_date
    @space_renter = space_renter
   
  end

  def self.create(space_id:, start_date:, end_date:)
    db_env_connection
    result = @@connection.exec(
      "INSERT INTO requests (space_id, start_date, end_date) 
      VALUES ('#{space_id}', '#{start_date}','#{end_date}') 
      RETURNING id, space_id, start_date, end_date, space_renter")
    result.map do |row|
      Request.new(
        id:result[0]['id'], 
        space_id:result[0]['space_id'], 
        start_date:result[0]['start_date'],
        end_date:result[0]['end_date'],
        space_renter:result[0]['space_renter']
        )
      end
  end

  def self.all
    db_env_connection

    result = @@connection.exec_params("SELECT * FROM requests")
    result.map do |row|
      Request.new(id: row['id'], space_id: row['space_id'], 
        start_date: row['start_date'], end_date: row['end_date'], space_renter: row['space_renter'] 
        )
    end
  end

  def self.confirmed
    db_env_connection
    
    d1 = Date.parse(Request.start_date).to_date
    d2 = Date.parse(Request.end_date).to_date

    db_env_connection

    d1.upto(d2) do |date|
      @@connection.exec_params("DELETE FROM available_dates WHERE available_dates = $1);", [date])
    end

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