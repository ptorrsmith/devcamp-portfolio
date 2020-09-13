class AddOrderToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :sort_order, :integer, :default => 1
  end
end
