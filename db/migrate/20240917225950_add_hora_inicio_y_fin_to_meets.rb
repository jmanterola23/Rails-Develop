class AddHoraInicioYFinToMeets < ActiveRecord::Migration[7.0]
  def change
    add_column :meets, :start_hour, :datetime
    add_column :meets, :end_hour, :datetime
  end
end
