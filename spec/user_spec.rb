require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@gmail.com', password: 'password12')

    expect(user).to be_a User
    expect(user.email).to eq 'test@gmail.com'
  end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password12')
  
      User.create(email: 'test@gmail.com', password: 'password12')
    end

end