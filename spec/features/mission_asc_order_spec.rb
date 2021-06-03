require 'rails_helper'

RSpec.feature 'mission ascend order', type: :feature do
  scenario 'mission listed in ascend order' do
    Mission.create(title: 'first', description: '1 hello world')
    Mission.create(title: 'second', description: '2 hello world')
    Mission.create(title: 'third', description: '3 hello world')

    visit '/missions'

    page.body.index('first').should < page.body.index('second')
    page.body.index('second').should < page.body.index('third')
  end
end
