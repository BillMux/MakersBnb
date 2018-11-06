feature 'login' do

  scenario 'page should have fill in form' do
    visit '/'
    click_button :log_in
    expect(page).to have_field (:email)
    expect(page).to have_field (:password)
    expect(page).to have_button (:submit)
  end

end
