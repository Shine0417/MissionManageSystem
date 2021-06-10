require 'rails_helper'

RSpec.feature 'edit mission', type: :feature do
  let!(:test_mission) { Mission.create(title: "test title", description: "hello world") }

  scenario 'Edit mission' do
    visit '/missions'
    click_link(I18n.t(:edit))

    fill_in I18n.t('activerecord.attributes.mission.title'), with: 'Test title 2'
    fill_in I18n.t('activerecord.attributes.mission.description'), with: 'Hello World 2'

    click_button(I18n.t(:submit))

    expect(page).to have_text /#{I18n.t(:update_mission, scope: :notice)}[\s\S]*Test title 2[\s\S]*Hello World 2/
  end
end