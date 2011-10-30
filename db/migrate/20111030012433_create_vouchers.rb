class CreateVouchers < ActiveRecord::Migration
  def self.up
    create_table :vouchers do |t|
      t.integer :deal_id
      t.integer :user_id
      t.string :value
      t.boolean :redeemed

      t.timestamps
    end
  end

  def self.down
    drop_table :vouchers
  end
end
