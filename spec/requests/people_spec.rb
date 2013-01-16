require 'spec_helper'

describe "People", :js => :true do
  before(:each) do
    @office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
    @child_organization = FactoryGirl.create(:organization, parent: @organization)
  end

  describe "GET /people" do
    before(:each) do
      @person = FactoryGirl.create(:person, organization: @child_organization, offices: [@office])
    end
  
    it "displays people" do
      visit people_path
      page.should have_content(@person.first_name)
      page.should have_content(@person.last_name)
      page.should have_content(@person.middle_name)
      page.should have_content(@person.office_names.join(', '))
      page.should have_content(@person.organization_names)
    end
  end
  
  describe "POST /people" do
    before(:each) do
      visit people_path
    end
    
    it "creates people" do
      click_link "Add Person"
      fill_in "First Name", :with => "First Name"
      fill_in "Last Name", :with => "Last Name"
      fill_in "Middle Name", :with => "Middle Name"
      select @office.name, :from => "office_ids_0"
      #click_link "Add an Office"
      select @child_organization.name, :from => "organization_id"
      click_button "Save and close"
    end
  end
end
