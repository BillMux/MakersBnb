feature 'signing up' do
  scenario 'user can sign up as a host' do
    visit '/'
    click_button 'Create Account'
    fill_in('email', with: 'an@email.com')
    fill_in('name', with: 'Jaguar Legend')
    fill_in('password', with: 'password')
    click_button 'submit'
    expect(page).to have_content 'Welcome, Jaguar!'
  end
  scenario 'user can sign up as a guest' do
    visit '/'
    click_button 'Create Account'
    fill_in('email', with: 'an@email.com')
    fill_in('name', with: 'Jaguar Legend')
    fill_in('password', with: 'password')
    click_button 'submit'
    expect(page).to have_content 'Welcome, Jaguar!'
  end
end
