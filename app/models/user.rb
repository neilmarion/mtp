class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :organization_id
  has_secure_password
  validates_presence_of :password, :on => :create
  
    #this should be for the User model
  def org_tree_node(o = nil)
    orgs = {}
    @org_ids ||= {}
    (o ? o.children : Organization.find(organization_id).children).order('name').each do |org|
      # collect roles associated with each org
      @org_ids[org.id] ||= {}
      orgs[org.id] = org_tree_node(org)
    end
    orgs
  end
end


