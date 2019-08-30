class RemoveDetailsFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :date, :date
    remove_column :schedules, :start_time, :time
    remove_column :schedules, :end_time, :time
  end
end
