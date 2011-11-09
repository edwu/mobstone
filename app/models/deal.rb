class Deal < ActiveRecord::Base
  has_many :vouchers
  has_many :milestones
  belongs_to :company
  has_many :users, :through => :vouchers

  accepts_nested_attributes_for :milestones
  
  mount_uploader :image, ImageUploader
  
  def current_price
    number_bought = self.vouchers.count
    sorted_milestones = self.milestones.sort{|a,b| b.people <=> a.people}
    
    previous_milestone = sorted_milestones[0]
  
    
    sorted_milestones.each do |milestone|
      if number_bought > milestone.people
        previous_milestone = milestone
        end        
    end
    
    return previous_milestone.price
       
  end
  
  def percent_reached
    number_bought = self.vouchers.count
    puts "number_bought:#{number_bought}"
    milestones = self.milestones
    max_milestone = milestones.maximum("people")
    puts "max_milestone:#{max_milestone}"
    
    return number_bought / (max_milestone*1.0)
  end

end
