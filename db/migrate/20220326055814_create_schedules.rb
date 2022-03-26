class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :finish_time
      t.boolean :allday
      t.text :note

      t.timestamps
    end
  end
end
