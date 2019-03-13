class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :title
      t.string :institution
      t.integer :year_obtained
      t.text :description

      t.timestamps
    end
  end
end
