class AddHighlightsToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :highlights, :text
  end
end
