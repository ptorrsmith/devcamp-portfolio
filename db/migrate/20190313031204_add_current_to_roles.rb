class AddCurrentToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :current, :boolean
  end
end
