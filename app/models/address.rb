class Address < ActiveRecord::Base
  attr_accessible :address, :longitude, :latitude
  
  belongs_to :person
  
  def is_latlng_present?
    return false if latitude.blank? or longitude.blank? or latitude.nil? or longitude.nil?
    return true
  end
end
