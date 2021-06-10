require 'rails_helper'

RSpec.feature 'show mission', type: :feature do
  let!(:test_mission) {  Mission.create(title: 'Test title', description: 'Hello World' ) }
  
  scenario 'Show mission' do
    visit '/missions'
    
    click_link(I18n.t(:show))
    expect(page).to have_text /Test title[\s\S]*Hello World/
  end
end