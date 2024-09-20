class CreateMeets < ActiveRecord::Migration[7.0]
  def change
    create_table :meets do |t|
      t.string :description
      t.integer :estimated_time
      t.integer :cant_asist

      t.timestamps
    end
  end
end
