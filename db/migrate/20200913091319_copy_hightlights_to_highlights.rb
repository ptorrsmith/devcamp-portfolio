class CopyHightlightsToHighlights < ActiveRecord::Migration[6.0]
  def up
    Role.all.each do |r|
      puts "******** Migrating #{r.id} - #{r.hightlights}"
      r.highlights = r.hightlights
      r.save!
      puts "******** Migrated #{r.id} - #{r.highlights}"
    end
  end
  def down
    Role.all.each do |r|
      puts "******** UnMigrating #{r.id} - #{r.highlights}"
      r.hightlights = r.highlights
      r.save!
      puts "******** UnMigrated #{r.id} - #{r.hightlights}"
    end
  end
end
