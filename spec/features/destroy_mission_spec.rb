require 'rails_helper'

RSpec.feature 'destroy mission', type: :feature do
  let(:test_mission) { { title: 'Test title', description: 'Hello World' } }

  scenario 'Delete mission', driver: :selenium_chrome_headless do
    Mission.create(title: test_mission[:title], description: test_mission[:description])

    visit '/missions'
    accept_alert do
      within("li#li_#{Mission.find_by(title: test_mission[:title])[:id]}") do
        click_link(I18n.t(:destroy))
      end
    end

    expect(page).to have_text(I18n.t(:destroy_mission, scope: :notice))
    expect(page).not_to have_text(test_mission[:title])
  end
end
