describe User do
  describe '.create' do
    it 'creates a new user' do
      expect{ User.create(
        :name => 'Bill',
        :email => 'billsemail@billisgreat.com',
        :password => 'password'
      ) }.to change {User.count}.by(1)

    end
  end


end
