class AddNoteToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :name, :text
  end
end
