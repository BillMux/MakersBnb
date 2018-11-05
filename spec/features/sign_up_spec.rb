feature 'signing up' do
  scenario 'user can sign up as a host' do
    visit '/'
    click_button 'Create Account'
    fill_in('email', with: 'an@email.com')
    fill_in('name', with: 'Jaguar Legend')
    fill_in('password', with: 'password')
    fill_in('confirm_password', with: 'password')
    check 'host'
    click_button 'Submit'
    expect(page).to have_content 'Welcome, Jaguar!'
  end
end
