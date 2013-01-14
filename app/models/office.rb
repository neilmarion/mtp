class Office < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :organization_id
  has_many :people_offices
  has_many :people, :through => :people_offices
  
  acts_as_tree
  
  validates_presence_of :name, message: "can't be blank"

  scope :roots, lambda { {
    :conditions => ["ancestry IS NULL"]
  } }
  
end
