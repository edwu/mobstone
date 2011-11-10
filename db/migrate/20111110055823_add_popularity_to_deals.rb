class AddPopularityToDeals < ActiveRecord::Migration
  def self.up
    add_column :deals, :popularity, :integer, :default => 0
  end

  def self.down
    remove_column :deals, :popularity
  end
end
