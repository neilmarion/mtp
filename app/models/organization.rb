class Organization < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :type_of_children
  attr_accessible :parent_id
  
  acts_as_tree
end
