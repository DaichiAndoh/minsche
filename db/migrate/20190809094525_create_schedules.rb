class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :title
      t.time :start_time
      t.time :end_time
      t.string :place
      t.text :detail
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
