class CreateInflatables < ActiveRecord::Migration
  def change
    create_table :inflatables do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.integer :buffer_time
      t.boolean :is_active
      t.float :up_to_4_hours
      t.float :up_to_8_hours

      t.timestamps
    end
  end
end
