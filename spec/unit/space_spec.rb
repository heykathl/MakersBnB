require 'space'

describe '.create' do
  it 'adds a new space listing' do
    user = User.create(email: 'test@gmail.com', password: 'password12')

    space = Space.create(name: '1 bed castle', description: 'This place rocks', price_per_night: '100', available_from: '2022-04-21', available_to: '2022-05-21', email: 'test@gmail.com')

    expect(space).to be_a Space
    expect(space.name).to eq '1 bed castle'
    expect(space.user_id).to eq user[0].id
  end

end

describe '.all' do
  it 'lists all the spaces' do
    user = User.create(email: 'test@gmail.com', password: 'password12')

    space = Space.create(name: '1 bed castle', description: 'This place rocks', price_per_night: '100', available_from: '2022-04-21', available_to: '2022-05-21', email: 'test@gmail.com')
    Space.create(name: '2 bed castle', description: 'This place rocks', price_per_night: '150', available_from: '2022-04-21', available_to: '2022-06-21', email: 'test@gmail.com')

    list = Space.all
  
    expect(list[0].id).to eq space.id
    expect(list[0].name).to eq '1 bed castle'
    expect(list[0].user_id).to eq user[0].id
    expect(list[0].available_to).to eq '2022-05-21'
    
  end

end

  describe '.find' do
    it 'lists all the spaces with available dates' do
      user = User.create(email: 'test@gmail.com', password: 'password12')
  
      Space.create(name: '1 bed castle', description: 'This place rocks', price_per_night: '100', available_from: '2022-04-21', available_to: '2022-04-25', email: 'test@gmail.com')
      Space.create(name: '2 bed castle', description: 'This place rocks', price_per_night: '150', available_from: '2022-05-21', available_to: '2022-05-23', email: 'test@gmail.com')
  
      list = Space.find

      p list

      expect(list[0]['space_name']).to eq '1 bed castle'
      expect(list[0]['available_dates']).to eq '2022-04-21'
      expect(list[1]['space_name']).to eq '1 bed castle'
      expect(list[1]['available_dates']).to eq '2022-04-22'
      expect(list[5]['space_name']).to eq '2 bed castle'
      expect(list[5]['available_dates']).to eq '2022-05-21'
      expect(list[6]['space_name']).to eq '2 bed castle'
      expect(list[6]['available_dates']).to eq '2022-05-22'
  
    end

end