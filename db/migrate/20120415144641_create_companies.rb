class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city, :limit => 128
      t.string :state, :limit => 32
      t.string :zipcode, :limit => 32
      t.string :status, :limit => 32, :default => 'pending'
      t.string :contact_email
      t.text :about

      t.timestamps
    end
    add_index :companies, :user_id
  end
end
