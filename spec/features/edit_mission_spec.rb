require 'rails_helper'

RSpec.feature 'edit mission', type: :feature do
  let(:test_mission) { { title: 'Test title', description: 'Hello World' } }

  scenario 'Edit mission' do
    Mission.create(title: test_mission[:title], description: test_mission[:description])

    visit '/missions'
    within("li[@id='li_#{Mission.find_by(title: test_mission[:title])[:id]}']") do
      click_link(I18n.t(:edit))
    end

    fill_in I18n.t(:title), with: 'Test title 2'
    fill_in I18n.t(:description), with: 'Hello World 2'

    click_button(I18n.t(:submit))

    expect(page).to have_text(I18n.t(:update_mission, scope: :notice))
    expect(page).to have_text('Test title 2')
    expect(page).to have_text('Hello World 2')
  end
end