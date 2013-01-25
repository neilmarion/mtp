class Address < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  
  belongs_to :person
  
  extend Geocoder::Model::ActiveRecord

  geocoded_by :address_for_geocode
  reverse_geocoded_by :latitude, :longitude, :address => :address
  before_validation :reverse_geocode  # auto-fetch address
  
  acts_as_gmappable
  
  def gmaps4rails_address
    @latitude = latitude
    @longitude = longitude
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}" 
  end
  
  def gmaps4rails_infowindow
    "<img src=\"#{'http://graph.facebook.com/joepagz/picture?type=normal'}\"> #{self.person.name}"
  end
  
  def restore_coordinates(lat, long)
    update_attributes({latitude: lat, longitude: long})
  end
end
