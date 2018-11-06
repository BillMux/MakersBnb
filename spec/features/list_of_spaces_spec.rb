feature 'available spaces' do
  scenario 'i can see a list of available spaces' do
    signup
    lists_spaces
    click_button 'view_spaces'
    expect(page).to have_content 'Available Spaces'
    expect(page).to have_content 'Jaguars House'
  end
end
