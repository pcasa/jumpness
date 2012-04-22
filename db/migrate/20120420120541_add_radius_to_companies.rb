class AddRadiusToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :max_radius, :integer
    Company.all.each do |company|
      company.update_attributes(:max_radius => 35)
    end
  end
  
  def down
    remove_column :companies, :max_radius
  end
end
