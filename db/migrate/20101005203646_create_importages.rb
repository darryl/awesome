class CreateImportages < ActiveRecord::Migration
  def self.up
    create_table :importages do |t|
      t.integer :mix_id
      t.integer :sample_id
      t.integer :simple_volume
      # t.float :start_time, :default => Float(0.0) # <---not sure why this wouldn't go
      t.decimal :start_time, :default => 0.0
      t.timestamps
    end
  end
end
