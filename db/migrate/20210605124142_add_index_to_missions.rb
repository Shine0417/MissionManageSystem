class AddIndexToMissions < ActiveRecord::Migration[6.1]
  def change
    add_index :missions, [:title, :status], unique: true
  end
end
