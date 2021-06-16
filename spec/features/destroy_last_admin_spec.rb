require 'rails_helper'

RSpec.feature 'destroy last admin', type: :feature do
#   let!(:login) { login_default }
    let!(:admin) { User.create(username: 'admin', password: '0000', role: 1) }
  scenario 'cannot delete' do
    login(admin)
    click_link I18n.t('user_management')
    first('tr').click_link I18n.t('destroy')
    first('tr').click_link I18n.t('destroy')
    
    expect(page).to have_text('admin')
    expect(page).not_to have_text('defaultuser')
  end
end
