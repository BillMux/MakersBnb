feature 'index' do
  scenario 'a user can visit the site' do
    visit '/'
    expect(page).to have_content 'MakersBnB'
  end

  scenario 'a user can sign up' do
    visit '/'
    click_link 'Signup'
    expect(page).to have_content 'Sign up'
  end

  scenario 'user can log in' do
    visit '/'
    click_link 'Login'
    expect(page).to have_content 'Login'
  end

  scenario 'user can post spaces' do
    visit '/'
    click_link 'New Space'
    expect(page).to have_content 'New space'
  end
end
