feature 'index' do
  scenario 'a user can visit the site' do
    visit '/'
    expect(page).to have_content 'MakersBnB'
  end

  scenario 'a user can sign up' do
    visit '/'
    click_button :create_account
    expect(page).to have_content 'Sign up'
  end

  scenario 'user can log in' do
    visit '/'
    click_button :log_in
    expect(page).to have_content 'Log in'
  end

  scenario 'user can post spaces' do
    visit '/'
    click_button :post_space
    expect(page).to have_content 'New space'
  end
end
