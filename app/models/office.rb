class Office < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :organization_id
  
  def self.deaconship
    @deaconship ||= Office.find_or_create_by_name_and_organization_id('deaconship', 0)
  end
  
  def self.choir
    @choir ||= Office.find_or_create_by_name_and_organization_id('choir', 0)
  end
  
  def self.finance
    @finance ||= Office.find_or_create_by_name_and_organization_id('finance', 0)
  end
  
  def self.secretariat
    @secretariat ||= Office.find_or_create_by_name_and_organization_id('secretariat', 0)
  end
  
  def self.scan
    @scan ||= Office.find_or_create_by_name_and_organization_id('scan', 0)
  end
  
  def self.pnk
    @pnk ||= Office.find_or_create_by_name_and_organization_id('pnk', 0)
  end
  
  def self.kapisanan
    @kapisanan ||= Office.find_or_create_by_name_and_organization_id('kapisanan', 0)
  end
  
end
