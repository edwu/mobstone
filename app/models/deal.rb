class Deal < ActiveRecord::Base
  has_many :vouchers
  has_many :milestones

end
