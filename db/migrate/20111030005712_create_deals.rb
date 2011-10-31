class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.integer :company_id
      t.integer :min_price
      t.string :description
      t.integer :org_price
      t.boolean :expired,    :default => false
      t.datetime :startdate
      t.integer :duration

      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end
