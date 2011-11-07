class AddTypeToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :category, :string, :default => "other"
  end

  def self.down
    remove_column :deals, :category
  end
end
