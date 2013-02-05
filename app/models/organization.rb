class Organization < ActiveRecord::Base
  attr_accessible :name, :ancestry, :longitude, :latitude, :address
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
  
  def latitude_longitude
    if longitude == nil && latitude == nil
      ancestry.split('/').reverse.each do |ancestor_id|
        ancestor = Organization.find(ancestor_id)
        if ancestor.longitude != nil && ancestor.latitude != nil
          return [ancestor.latitude, ancestor.longitude]
        end
      end
    else
      [latitude ,longitude]
    end
  end
end
