class AddStartTimeAndEndTimeToAssigns < ActiveRecord::Migration[7.0]
  def change
    add_column :assigns, :start_time, :datetime
    add_column :assigns, :end_time, :datetime
  end
end
