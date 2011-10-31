class AddIsCompanyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_company, :boolean, :default => false
  end

  def self.down
    remove_column :users, :is_company
  end
end
