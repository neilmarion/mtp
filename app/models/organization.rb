class Organization < ActiveRecord::Base
  attr_accessible :name, :ancestry
  attr_accessible :type_of_children
  attr_accessible :parent_id
  
  acts_as_tree
  
  has_many :people, :dependent => :destroy
  validates_presence_of :name, message: "can't be blank"
  
  def ancestors_up_to_current_organization(org)    
    organizations = []
    
    ancestry.split('/').reverse.each do |org_id|
      return organizations.reverse if org.id.to_s == org_id
      organizations << Organization.find(org_id)
    end
    
    organizations.reverse
  end
end
