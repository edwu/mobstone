class Deal < ActiveRecord::Base
  has_many :vouchers
  has_many :milestones
  belongs_to :company

end
