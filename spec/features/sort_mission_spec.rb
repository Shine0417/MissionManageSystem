require 'rails_helper'

RSpec.feature 'sort mission', type: :feature do
  let!(:first) { Mission.create(title: 'Atest', description: 'a hello world', due_date: Time.new(2015, 1, 2, 3, 4, 5)) }
  let!(:second) { Mission.create(title: 'Btest', description: 'b hello world', due_date: Time.new(2016, 1, 2, 3, 4, 5)) }
  let!(:third) { Mission.create(title: 'Ctest', description: 'c hello world', due_date: Time.new(2017, 1, 2, 3, 4, 5)) }

  scenario 'by default(create time)' do
    visit '/missions'
    within_table('mission_table') do
      expect(page).to have_text /Atest.*Btest.*Ctest/
    end
  end

  scenario 'by due date reverse' do
    visit '/missions'
    page.select 'due_date', from: 'sort'
    page.check('reverse')
    click_button I18n.t('submit')

    within_table('mission_table') do
      expect(page).to have_text /Ctest.*Btest.*Atest/
    end
  end
end
