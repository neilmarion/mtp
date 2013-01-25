class Address < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  
  belongs_to :person
  
  geocoded_by :address_for_geocode
  reverse_geocoded_by :latitude, :longitude, :address => :address
  after_create :reverse_geocode  # auto-fetch address
  
  def get_address
    address
  end
end
