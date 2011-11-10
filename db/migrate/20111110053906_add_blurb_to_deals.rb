class AddBlurbToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :blurb, :string
  end

  def self.down
    remove_column :deals, :blurb
  end
end
