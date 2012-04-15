class AddCachedSlugToInflatables < ActiveRecord::Migration
  
  def self.up
    add_column :inflatables, :cached_slug, :string
    add_index  :inflatables, :cached_slug
  end

  def self.down
    remove_column :inflatables, :cached_slug
  end
  
end
