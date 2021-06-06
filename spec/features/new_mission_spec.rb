require 'rails_helper'

RSpec.feature 'new mission', type: :feature do
  let(:test_mission) { { title: 'Test title', description: 'Hello World' } }

  scenario 'Add new mission' do
    visit '/missions'
    click_link(I18n.t(:new_mission))

    fill_in I18n.t('activerecord.attributes.mission.title'), with: test_mission[:title]
    fill_in I18n.t('activerecord.attributes.mission.description'), with: test_mission[:description]

    click_button(I18n.t(:submit))

    expect(page).to have_text(I18n.t(:create_mission, scope: :notice))
    expect(page).to have_text(test_mission[:title])
  end
  
end
