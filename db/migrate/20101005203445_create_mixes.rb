class CreateMixes < ActiveRecord::Migration
  def self.up
    create_table :mixes do |t|
      t.string :name
      t.text :desc
      t.integer :musician_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mixes
  end
end
