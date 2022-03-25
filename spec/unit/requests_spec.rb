require 'request'

describe ".create" do

  it "creates a request" do
    User.create(email: "maker@maker.com", password: "12345@") 
    user = User.find("maker@maker.com")
    space = Space.create(name: "1 bed castle", description: "This place rocks!", price_per_night: 100, available_from: '2022-01-01', available_to: '2022-10-01', email: "maker@maker.com")
    request = Request.create(space_id: space.id, start_date: '2022-01-01', end_date: '2022-02-01')

    expect(request[0].start_date).to eq '2022-01-01'
    expect(request[0].end_date).to eq '2022-02-01'
  end
end 

describe '.confirm' do
  
  it "confirms the booking request" do
    User.create(email: "maker@maker.com", password: "12345@") 
    User.find("maker@maker.com")
    space = Space.create(name: "1 bed castle", description: "This place rocks!", price_per_night: 100, available_from: '2022-01-01', available_to: '2022-10-01', email: "maker@maker.com")
    request = Request.create(space_id: space.id, start_date: '2022-01-01', end_date: '2022-02-01')

    Request.confirmed(booking_request_id: request[0].id)
    expect(request[0].confirmed).to eq true

  end
end