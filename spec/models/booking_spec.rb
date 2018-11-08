describe Booking do
  describe '.create' do
    it 'creates a new space' do
      expect do
        Booking.create(
          start_date: '2018/11/09',
          end_date: '2018/11/16',
          user_id: 3,
          space_id: 1
        )
      end .to change { Booking.count }.by(1)
    end
  end
end
