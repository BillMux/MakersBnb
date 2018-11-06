feature 'listing properties' do
  scenario 'I can upload a property' do
    visit '/list-new'
    fill_in('title', with: 'Jaguars House')
    fill_in('description', with: 'A cosy and quite double room')
    fill_in('location', with: 'Central London')
    fill_in('guests', with: 2)
    fill_in('type', with: 'room')
    click_button 'submit'
    expect(page).to have_content 'Property listed successfully!'
  end
end
