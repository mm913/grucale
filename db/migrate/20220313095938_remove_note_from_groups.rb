class RemoveNoteFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :note, :text
  end
end
