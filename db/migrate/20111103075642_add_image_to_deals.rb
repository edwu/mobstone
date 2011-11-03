class AddImageToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :image, :string
  end

  def self.down
    remove_column :deals, :image
  end
end
