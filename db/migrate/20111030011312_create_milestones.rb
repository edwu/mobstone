class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :deal_id
      t.integer :percent
      t.integer :people

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
