require 'rails_helper'

RSpec.feature 'error page', type: :feature do
  let!(:login) { login_default }

  scenario 'should show 404 not found' do
    visit '/bad_url'
    expect(page.text).to have_text(I18n.t('errors.not_found'))
  end

  xscenario 'should show 500 internal server error' do
    # Hard to produce
  end
end
