describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        :name => 'Bill',
        :email => 'billsemail@billisgreat.com',
        :password => 'password'
      )
      expect(user.name).to eq 'Bill'
    end
  end


end
