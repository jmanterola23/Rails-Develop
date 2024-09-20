class CreateAssigns < ActiveRecord::Migration[7.0]
  def change
    create_table :assigns do |t|
      t.references :room, null: false, foreign_key: true
      t.references :meet, null: false, foreign_key: true
      t.string :schedule

      t.timestamps
    end
  end
end
