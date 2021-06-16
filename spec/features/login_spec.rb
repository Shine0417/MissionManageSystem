require 'rails_helper'

RSpec.feature 'login user', type: :feature do
  scenario 'can login' do
    user = User.create(username: 'test', password: '0000')
    login(user)
    visit "/"
    fill_in "username", :with => "test"
    fill_in "password", :with => "0000"

    click_button(I18n.t("login"))
    expect(page).to have_text(I18n.t('login_success'))
  end
end
