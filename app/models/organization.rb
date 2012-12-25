class Organization < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :type_of_children
  
  acts_as_tree
end
