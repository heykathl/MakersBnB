require 'space'

describe '.create' do
  it 'adds a new space listing' do
    user = User.create(email: 'test@gmail.com', password: 'password12')

    space = Space.create(name: '1 bed castle', description: 'This place rocks', price_per_night: '100', available_from: '2022-04-21', available_to: '2022-05-21', email: 'test@gmail.com')

    expect(space).to be_a Space
    expect(space.name).to eq '1 bed castle'
    expect(space.user_id).to eq user.id
  end

end

describe '.all' do
  it 'lists all the spaces' do
    user = User.create(email: 'test@gmail.com', password: 'password12')

    Space.create(name: '1 bed castle', description: 'This place rocks', price_per_night: '100', available_from: '2022-04-21', available_to: '2022-05-21', email: 'test@gmail.com')
    Space.create(name: '2 bed castle', description: 'This place rocks', price_per_night: '150', available_from: '2022-04-21', available_to: '2022-06-21', email: 'test@gmail.com')

    list = Space.all
    expect(list[1]['space_name']).to eq '2 bed castle'
    expect(list[0]['space_name']).to eq '1 bed castle'

  end

end