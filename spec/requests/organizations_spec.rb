require 'spec_helper'

describe "Organizations", :js => :true do
  before(:each) do
    @org_1 = FactoryGirl.create(:organization)
    @org_2 = FactoryGirl.create(:organization, parent: @org_1)
    @org_3 = FactoryGirl.create(:organization, parent: @org_1)
    @org_4 = FactoryGirl.create(:organization, parent: @org_2)
    @org_5 = FactoryGirl.create(:organization, parent: @org_2)
  end

  describe "GET /organizations" do
    before(:each) do
      visit organizations_path
    end
  
    it "displays 2nd-level organizations at redirect" do
      page.should have_content(@org_2.name)
      page.should have_content(@org_3.name)
    end
    
    it "sub-orgs of an org at click" do
      click_link @org_2.name
      page.should have_content(@org_4.name)
      page.should have_content(@org_5.name)
    end
  end
end
