class AddMissionsCountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :missions_count, :integer, default: 0

    User.pluck(:id).each do |user|
      User.reset_counters(user, :mission)
    end
  end
end
