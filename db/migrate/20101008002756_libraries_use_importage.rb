class LibrariesUseImportage < ActiveRecord::Migration
  def self.up
add_column :importages, :library_id, :integer
  end

  def self.down
    remove_column :importages, :library_id
  end
end
