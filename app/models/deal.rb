class Deal < ActiveRecord::Base
  has_many :vouchers
  has_many :milestones
  belongs_to :company
  has_many :users, :through => :vouchers

  accepts_nested_attributes_for :milestones
  
  mount_uploader :image, ImageUploader

end
