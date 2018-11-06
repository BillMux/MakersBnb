describe Space do
  describe '.create' do
    it 'creates a new space' do
      expect do
        Space.create(
          title: 'Jaguars House',
          description: 'A cosy and warm double room',
          location: 'Central London',
          guests: 2,
          type: 'room',
          user_id: 2
        )
      end .to change { Space.count }.by(1)
    end
  end
end
