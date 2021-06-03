require 'rails_helper'

RSpec.feature 'show mission', type: :feature do
  let(:test_mission) { { title: 'Test title', description: 'Hello World' } }
  
  scenario 'Show mission' do
    Mission.create(title: test_mission[:title], description: test_mission[:description])

    visit '/missions'
    within("li[@id='li_#{Mission.find_by(title: test_mission[:title])[:id]}']") do
      click_link(I18n.t(:show))
    end
    expect(page).to have_text(test_mission[:title])
    expect(page).to have_text(test_mission[:description])
  end
end