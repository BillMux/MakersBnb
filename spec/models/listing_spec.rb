describe Listing do
  describe '.create' do
    it 'creates a new list' do
      expect do
        Listing.create(
          title: 'Jaguars House',
          description: 'A cosy and quiet double room',
          location: 'Central London',
          guests: 2,
          type: 'room'
        )
      end .to change { Listing.count }.by(1)
    end
  end
end
