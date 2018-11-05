describe User do
  describe '.create' do
    it 'creates a new user' do
      expect do
        User.create(
          name: 'Bill',
          email: 'billsemail@billisgreat.com',
          password: 'password'
        )
      end .to change { User.count }.by(1)
    end
  end
end
