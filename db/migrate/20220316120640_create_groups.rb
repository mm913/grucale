class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :group_name, null: false, default:""
      t.text :note
      t.timestamps
    end
    add_index :groups, :group_name, unique: true
  end
end
