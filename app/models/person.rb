class Person < ActiveRecord::Base
  attr_accessible :birth_date, :first_name, :last_name, :middle_name, :office_id, :organization_id, :cfo_id, :people_offices_attributes, :addresses_attributes, :phone_numbers_attributes, :fb_profile
  
  belongs_to :organization
  belongs_to :cfo
  has_many :people_offices, :dependent => :destroy
  has_many :offices, :through => :people_offices
  has_many :addresses, :dependent => :destroy
  has_many :phone_numbers, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  accepts_nested_attributes_for :phone_numbers, :allow_destroy => true
  
  accepts_nested_attributes_for :people_offices, :allow_destroy => true
  
  validates_presence_of :first_name, :last_name, :organization, message: "can't be blank"
  
  def name
    [first_name, middle_name, last_name].collect(&:to_s).join(' ')
  end
  
  def office_names
    names = []
    offices.each do |o|
      names += [get_names_of_self_and_parents(o).reverse.join(" - ")]
    end
    names
  end
  
  def organization_names(up_to_org)
    names = []
    get_names_of_self_and_parents(organization, up_to_org).reverse.join(" - ")
  end
  
  def delete_offices
    people_offices.collect(&:destroy)
  end
  
  def delete_addresses
    addresses.collect(&:destroy)
  end
  
  def delete_phone_numbers
    phone_numbers.collect(&:destroy)
  end
  
  def fb_username
    fb_profile.nil? ? "" : fb_profile.split('/').last
  end
  
  def fb_profile_pic_square
    "http://graph.facebook.com/#{fb_username}/picture?type=square"
  end
  
  def fb_profile_pic_small
    "http://graph.facebook.com/#{fb_username}/picture?type=small"
  end
  
  def fb_profile_pic_normal
    "http://graph.facebook.com/#{fb_username}/picture?type=normal"
  end
  
  def fb_profile_pic_large
    "http://graph.facebook.com/#{fb_username}/picture?type=large"
  end
  
  protected
  
  def get_names_of_self_and_parents(o, org = nil)
    return [] if o.nil?
    names = ["#{o.name}"] if o.instance_of? Office
    names = ["#{o.parent.type_of_children unless o.ancestry.nil?} #{o.name}"] if o.instance_of? Organization
    
    puts org.id == o.id if org
    puts o.inspect
    
    if o.ancestry == nil || ( org.id == o.id if org)
      return ["#{o.name}"] if o.instance_of? Office
      return [] if o.instance_of? Organization
    else
      names += org ? get_names_of_self_and_parents(o.parent, org) : get_names_of_self_and_parents(o.parent)
    end
    
    names
  end
  
end
