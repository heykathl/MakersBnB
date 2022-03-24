require 'request'
require 'space'

class Calendar

  

  def self.confirmed
    db_env_connection
    #if confirmed
    d1 = Date.parse(Request.start_date).to_date
    d2 = Date.parse(Request.end_date).to_date

    db_env_connection

    d1.upto(d2) do |date|
      @@connection.exec_params("DELETE FROM available_dates WHERE available_dates = $1);", [date])
    end

  end


  
  Space.new(id: result[0]['id'], name: result[0]['space_name'], available_from: result[0]['available_from'], available_to: result[0]['available_to'], user_id: result[0]['user_id'])


end