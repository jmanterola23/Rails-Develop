class AddRoomIdToMeets < ActiveRecord::Migration[7.0]
  def change
    add_reference :meets, :room, null: false, foreign_key: true
  end
end
