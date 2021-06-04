class AddDueDateToMissions < ActiveRecord::Migration[6.1]
  def change
    add_column :missions, :due_date, :datetime
  end
end
