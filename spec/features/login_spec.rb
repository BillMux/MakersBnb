feature 'login' do
  scenario 'page should have fill in form' do
    visit '/'
    click_button :log_in
    expect(page).to have_field :email
    expect(page).to have_field :password
    expect(page).to have_button :submit
  end
 scenario 'a user sees an error if they get their email wrong' do
   visit'/'
   click_button :log_in
   fill_in('email', with: 'muge.hasilc@hotmail.com')
   fill_in('password', with: 'kizkulesi')
   click_button 'submit'
   expect(page).to have_content 'Please check you intered your info is correct.'
 end
end



# scenario 'a user sees an error if they get their email wrong' do
#     User.create(email: 'test@example.com', password: 'password123')
#
#     visit '/sessions/new'
#     fill_in(:email, with: 'nottherightemail@me.com')
#     fill_in(:password, with: 'password123')
#     click_button('Sign in')
#
#     expect(page).not_to have_content 'Welcome, test@example.com'
#     expect(page).to have_content 'Please check your email or password.'
#   end
#
#   scenario 'a user sees an error if they get their password wrong' do
#     User.create(email: 'test@example.com', password: 'password123')
#
#     visit '/sessions/new'
#     fill_in(:email, with: 'test@example.com')
#     fill_in(:password, with: 'wrongpassword')
#     click_button('Sign in')
#
#     expect(page).not_to have_content 'Welcome, test@example.com'
#     expect(page).to have_content 'Please check your email or password.'
#   end
