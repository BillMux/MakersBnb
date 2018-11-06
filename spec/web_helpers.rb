def signup
  visit '/'
  click_button 'Create Account'
  fill_in('email', with: 'an@email.com')
  fill_in('name', with: 'Jaguar Legend')
  fill_in('password', with: 'password')
  click_button 'submit'
end

def lists_properties
  click_button 'List Property'
  fill_in('title', with: 'Jaguars House')
  fill_in('description', with: 'A cosy and quiet double room')
  fill_in('location', with: 'Central London')
  fill_in('guests', with: 2)
  fill_in('type', with: 'room')
  click_button 'Submit'
end
