require 'request'

describe ".create" do

  it "creates a request" do
    User.create(email: "maker@maker.com", password: "12345@") 
    space = Space.create(name: "1 bed castle", description: "This place rocks!", price_per_night: 100, available_from: '2022-01-01', available_to: '2022-10-01', email: 'maker@maker.com')
    request = Request.create(space_id: space.id, start_date: '2022-01-01', end_date: '2022-02-01')

    expect(request.start_date).to eq '2022-01-01'
    expect(request.end_date).to eq '2022-02-01'
  end
end 