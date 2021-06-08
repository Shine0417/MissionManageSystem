require 'rails_helper'

RSpec.feature 'sort mission', type: :feature do
  let!(:first) { Mission.create(title: 'Atest', description: 'a hello world', due_date: Time.new(2015, 1, 2, 3, 4, 5), priority: 2) }
  let!(:second) { Mission.create(title: 'Btest', description: 'b hello world', due_date: Time.new(2016, 1, 2, 3, 4, 5), priority: 1) }
  let!(:third) { Mission.create(title: 'Ctest', description: 'c hello world', due_date: Time.new(2017, 1, 2, 3, 4, 5), priority: 0) }

  scenario 'by default(create time)' do
    visit '/missions'
    within_table('mission_table') do
      expect(page).to have_text /Atest[\s\S]*Btest[\s\S]*Ctest/
    end
  end

  scenario 'by due date reverse' do
    visit '/missions'
    page.select I18n.t('mission.due_date'), from: 'sort'
    page.check('reverse')
    click_button I18n.t('search')

    within_table('mission_table') do
      expect(page).to have_text /Ctest[\s\S]*Btest[\s\S]*Atest/
    end
  end

  scenario 'by priority' do
    visit '/missions'

    page.select I18n.t('mission.priority'), from: 'sort'
    click_button I18n.t('search')

    within_table('mission_table') do
      expect(page).to have_text /Ctest[\s\S]*Btest[\s\S]*Atest/
    end

    page.check('reverse')
    click_button I18n.t('search')

    within_table('mission_table') do
      expect(page).to have_text /Atest[\s\S]*Btest[\s\S]*Ctest/
    end
  end
end
