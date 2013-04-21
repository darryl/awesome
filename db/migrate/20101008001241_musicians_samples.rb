class MusiciansSamples < ActiveRecord::Migration
  def self.up
    create_table :musicians_samples do |t| 
      t.integer :musician_id
      t.integer :sample_id
    end
  end

  def self.down
    drop_table :musicians_samples
  end
end
