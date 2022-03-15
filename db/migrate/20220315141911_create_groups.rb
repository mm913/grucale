class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :group_name,  null: false, default: ""
      t.string :password_digest,  null: false, default: ""
      t.text :note
      t.timestamps
    end
  end
end
