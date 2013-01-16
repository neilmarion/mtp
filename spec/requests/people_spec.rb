require 'spec_helper'

describe "People", :js => :true do
  before(:each) do
    @office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
    @child = FactoryGirl.create(:organization, parent: @organization)
  end
  
  describe "GET /people" do
    before(:each) do
      @person = FactoryGirl.create(:person, organization: @child, offices: [@office])
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
      fill_in "Last Name", :with => "Last Name"
      select(@office.name, :from => "office_ids_0")
      click_link "Add an Office"
    end
  end
end
