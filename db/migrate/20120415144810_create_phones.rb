class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :company_id
      t.string :number, :limit => 32
      t.string :provider, :limit => 128
      t.string :phone_type, :limit => 32

      t.timestamps
    end
    add_index :phones, :company_id
  end
end
