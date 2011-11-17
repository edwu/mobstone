class Milestone < ActiveRecord::Base
  belongs_to :deal
  validates :price, :presence => true
  validates :people, :presence => true

end
