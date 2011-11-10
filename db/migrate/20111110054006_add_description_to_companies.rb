class AddDescriptionToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :description, :string
  end

  def self.down
    remove_column :companies, :description
  end
end
