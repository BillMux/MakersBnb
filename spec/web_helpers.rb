def signup
  visit '/'
  click_button 'Create Account'
  fill_in('email', with: 'an@email.com')
  fill_in('name', with: 'Jaguar Legend')
  fill_in('password', with: 'password')
  click_button 'submit'
end
