class List do

  describe User do
    describe '.create' do
      it 'creates a new list' do
        expect do
          User.create(
            title:'Jaguars House'
            description: 'A cosy and quite double room'
            location: 'Central London'
            guests: 2
            type: 'room'
          )
        end .to change { List.count }.by(1)
      end
    end
  end
