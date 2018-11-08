feature 'throws error' do
  scenario 'when user types wrong password' do
    visit '/'
    click_button 'Log In'
    fill_in('email', with: 'an@email.com')
    fill_in('password', with: 'passwords')
    expect(page).not_to have_content 'Welcome, Jaguar Legend'
    expect(page).to have_content 'Incorrect password.'
  end

  scenario 'when user types wrong email' do
    visit '/'
    click_button 'Log In'
    fill_in('email', with: 'wrong@email.com')
    fill_in('password', with: 'password')
    expect(page).not_to have_content 'Welcome, Jaguar Legend'
    expect(page).to have_content 'This email is not registered.'
  end
end
