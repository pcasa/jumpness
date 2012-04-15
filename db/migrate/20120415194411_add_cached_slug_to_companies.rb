class AddCachedSlugToCompanies < ActiveRecord::Migration
  
  def self.up
    add_column :companies, :cached_slug, :string
    add_index  :companies, :cached_slug
  end

  def self.down
    remove_column :companies, :cached_slug
  end
  
end
