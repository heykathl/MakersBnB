require 'pg'
require 'user'
require 'space'

class Request 

  attr_reader :id, :space_id, :start_date, :end_date

  def initialize(id:, space_id:, start_date:, end_date:)
    @id = id
    @space_id = space_id
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(space_id:, start_date:, end_date:)
    db_env_connection
    result = @@connection.exec(
      "INSERT INTO requests (space_id, start_date, end_date) 
      VALUES ('#{space_id}', '#{start_date}', '#{end_date}') 
      RETURNING id, space_id, start_date, end_date")
    Request.new(
      id:result[0]['id'], 
      space_id:result[0]['space_id'], 
      start_date:result[0]['start_date'],
      end_date:result[0]['end_date']
      )
  end

  def self.db_env_connection

    if ENV['ENVIRONMENT'] == "test"
      @@connection = PG.connect(dbname: 'makersbnb_test')
    else
      @@connection = PG.connect(dbname: 'makersbnb')
    end

  end

end 