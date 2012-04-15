class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :inflatable_id
      t.string :image
      t.boolean :primary, :default => false

      t.timestamps
    end
    add_index :photos, :inflatable_id
    add_index :photos, :primary
  end
end
