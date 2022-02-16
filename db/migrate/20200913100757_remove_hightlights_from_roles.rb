class RemoveHightlightsFromRoles < ActiveRecord::Migration[6.0]
  def up
    remove_column :roles, :hightlights
  end
  def down
    add_column :roles, :hightlights, :text
  end
end
