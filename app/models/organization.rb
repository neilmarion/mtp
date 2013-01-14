class Organization < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :type_of_children
  attr_accessible :parent_id
  
  acts_as_tree
  
  has_many :people
  validates_presence_of :name, message: "can't be blank"
end
