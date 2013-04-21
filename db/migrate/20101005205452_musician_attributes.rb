class MusicianAttributes < ActiveRecord::Migration
  def self.up
    add_column :musicians, :name, :string
    add_column :musicians, :zipcode, :string
    add_column :musicians, :desc, :text, :default => 'i like turtles.'
  end

  def self.down
    remove_column :musicians, :name
    remove_column :musicians, :zipcode
    remove_column :musicians, :desc
  end
end
