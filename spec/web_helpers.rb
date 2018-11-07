def signup
  visit '/'
  click_button 'Create Account'
  fill_in('email', with: 'an@email.com')
  fill_in('name', with: 'Jaguar Legend')
  fill_in('password', with: 'password')
  click_button 'submit'
end

def lists_spaces
  click_button :home
  click_button 'post_space'
  fill_in('title', with: 'Jaguars House')
  fill_in('description', with: 'A cosy and quiet double room')
  fill_in('location', with: 'Central London')
  fill_in('guests', with: 2)
  fill_in('type', with: 'room')
  click_button 'Submit'
  click_button 'home'
end
