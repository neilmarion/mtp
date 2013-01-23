require 'spec_helper'

describe "Organizations", :js => :true do
  before(:each) do
    @org_1 = FactoryGirl.create(:organization)
    @org_2 = FactoryGirl.create(:organization, parent: @org_1)
    @org_3 = FactoryGirl.create(:organization, parent: @org_1)
    @org_4 = FactoryGirl.create(:organization, parent: @org_2)
    @org_5 = FactoryGirl.create(:organization, parent: @org_2)
    
    visit organizations_path
  end

  describe "GET /organizations" do
    it "displays 2nd-level organizations at redirect" do
      page.should have_content(@org_2.name)
      page.should have_content(@org_3.name)
    end
    
    it "displays sub-orgs of an org at click" do
      click_link @org_2.name
      page.should have_content(@org_4.name)
      page.should have_content(@org_5.name)
    end
  end
  
  describe "POST /organizations" do
    it "adds an organization" do
      click_link "+ Add new #{@org_1.type_of_children}"
      fill_in "Name", :with => "New Org"
      fill_in "Type of children", :with => "Children"
      click_button "Save and close"
      page.should have_content "New Org"
    end
    
    it "adds an organization (Save and Add Another)" do
      click_link "+ Add new #{@org_1.type_of_children}"
      fill_in "Name", :with => "New Org"
      fill_in "Type of children", :with => "Children"
      click_button "Save and add another"
      page.should have_content "New Org"
      
      page.should have_content "Add a Sub-Organization"
      
      fill_in "Name", :with => "New Org 2"
      fill_in "Type of children", :with => "Children"
      click_button "Save and add another"
      page.should have_content "New Org 2"
    end
  end
end
