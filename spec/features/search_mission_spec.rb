require 'rails_helper'

RSpec.feature 'search mission', type: :feature do
  let!(:first) { Mission.create(title: 'Atest', description: 'a hello world', due_date: Time.new(2015, 1, 2, 3, 4, 5) , status: 0) }
  let!(:second) { Mission.create(title: 'Btest', description: 'b hello world', due_date: Time.new(2016, 1, 2, 3, 4, 5) , status: 1) }
  
  scenario 'search title' do
    visit '/missions'

    fill_in :title, with: 'Atest'
    click_button I18n.t('search')

    expect(page).to have_text 'Atest'
    expect(page).not_to have_text 'Btest'
  end

  scenario 'search status' do
    visit '/missions'

    page.select I18n.t('activerecord.attributes.mission.in_progress'), from: :status
    click_button I18n.t('search')

    expect(page).not_to have_text 'Atest'
    expect(page).to have_text 'Btest'
  end

  scenario 'search empty' do
    visit '/missions'
    page.select I18n.t('activerecord.attributes.mission.complete'), from: :status
    click_button I18n.t('search')

    expect(page).not_to have_text 'Atest'
    expect(page).not_to have_text 'Btest'
  end
end
