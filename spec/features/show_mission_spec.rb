require 'rails_helper'

RSpec.feature 'show mission', type: :feature do
  let!(:login) { login_default }
  let!(:first) { Mission.create(title: 'Test title', description: 'Hello World', due_date: Time.new(2015, 1, 2, 3, 4, 5) , status: 0, user_id: get_default_userid) }

  scenario 'Show mission' do
    visit '/missions'
    
    click_link(I18n.t(:show))
    expect(page).to have_text /Test title[\s\S]*Hello World/
  end
end