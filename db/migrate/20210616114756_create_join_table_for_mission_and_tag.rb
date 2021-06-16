class CreateJoinTableForMissionAndTag < ActiveRecord::Migration[6.1]
  def change
    create_table :missions_tags, id: false do |t|
      t.belongs_to :mission, index: true
      t.belongs_to :tag, index: true
    end
  end
end
