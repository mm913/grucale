class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :group_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
