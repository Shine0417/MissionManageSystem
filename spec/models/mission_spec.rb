require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe 'Validations' do
    subject { Mission.new(title: 'Test Title Unique', description: 'Test Description') }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    it { should have_db_index(%i[title status]).unique }
  end
end
