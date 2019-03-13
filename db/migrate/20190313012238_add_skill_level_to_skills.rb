class AddSkillLevelToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :skill_level, :integer
  end
end
