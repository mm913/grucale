class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :finish_time
      t.boolean :all_day
      t.text :note
      t.references :group, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
