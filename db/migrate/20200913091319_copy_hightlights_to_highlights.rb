class CopyHightlightsToHighlights < ActiveRecord::Migration[6.0]
  def change
    Role.all.each do |r|
      puts "******** Migrating #{r.id} - #{r.hightlights}"
      r.highlights = r.hightlights
      r.save!
      puts "******** Migrated #{r.id} - #{r.highlights}"
    end
  end
end
