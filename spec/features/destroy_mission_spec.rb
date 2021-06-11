require 'rails_helper'

RSpec.feature 'destroy mission', type: :feature do
  let!(:login) { login_default }
  let!(:test_mission) { Mission.create(title: 'test title', description: 'hello world', user_id: get_default_userid) }

  scenario 'Delete mission', driver: :selenium_chrome_headless do
    visit '/missions'
    
    accept_alert do
      find('td', text: I18n.t(:destroy)).click_link(I18n.t(:destroy))
    end

    expect(page).to have_text(I18n.t(:destroy_mission, scope: :notice))
    expect(page).not_to have_text('test title')
  end
end
