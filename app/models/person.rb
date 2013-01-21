class Person < ActiveRecord::Base
  attr_accessible :birth_date, :first_name, :last_name, :middle_name, :office_id, :organization_id, :cfo_id, :people_offices_attributes
  
  belongs_to :organization
  belongs_to :cfo
  has_many :people_offices
  has_many :offices, :through => :people_offices
  
  accepts_nested_attributes_for :people_offices, :allow_destroy => true
  
  validates_presence_of :first_name, :last_name, message: "can't be blank"
  
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
  
  def organization_names
    names = []
    get_names_of_self_and_parents(organization).reverse.join(" - ")
  end
  
  protected
  
  def get_names_of_self_and_parents(o)
    return [] if o.nil?
    names = [o.name]
    
    if o.ancestry == nil
      return [o.name]
    else
      names += get_names_of_self_and_parents(o.parent)
    end
    
    
    
    names
  end
  
end
