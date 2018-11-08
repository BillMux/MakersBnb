feature 'available spaces' do
  scenario 'i can see a list of available spaces' do
    visit '/'
    click_link 'Signup'
    fill_in('email', with: 'an@ehhfkuhmail.com')
    fill_in('name', with: 'Jaguar3 Legend')
    fill_in('password', with: 'nnnn')
    click_button :submit
    click_button :home
    click_button 'New Space'
    fill_in('title', with: 'Jaguars House')
    fill_in('description', with: 'A cosy and quiet double room')
    fill_in('location', with: 'Central London')
    fill_in('guests', with: 2)
    fill_in('type', with: 'room')
    fill_in('price', with: 20)
    click_button 'Submit'
    click_button 'Home'
    click_button 'View Spaces'
    expect(page).to have_content 'Available Spaces'
    expect(page).to have_content 'Jaguars House'
  end
end
