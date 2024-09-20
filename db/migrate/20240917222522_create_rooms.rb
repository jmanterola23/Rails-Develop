class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :available_schedule
      t.integer :max_capacity

      t.timestamps
    end
  end
end
