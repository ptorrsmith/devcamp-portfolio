class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :organisation
      t.string :location
      t.date :from
      t.date :to
      t.text :roles
      t.text :description
      t.text :hightlights

      t.timestamps
    end
  end
end
