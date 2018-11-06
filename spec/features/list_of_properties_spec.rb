feature 'available properties' do
  scenario 'i can see a list of available properties' do
    signup
    lists_properties
    click_button 'Home'
    click_button 'View Properties'
    expect(page).to have_content 'Available Properties'
    expect(page).to have_content 'Jaguars House'
  end
end
