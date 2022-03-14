class RemoveNameFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :name, :text
  end
end
