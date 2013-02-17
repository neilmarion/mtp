require 'spec_helper'

describe "People", :js => :true do
  before(:each) do
    @office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
    @org_0 = FactoryGirl.create(:organization, parent: @organization)
    @org_1 = FactoryGirl.create(:organization, parent: @org_0)
    @user = FactoryGirl.create(:user, organization: @org_0)
    
    visit new_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button "Log in"
  end

  describe "GET /people" do
    before(:each) do
      @person = FactoryGirl.create(:person, organization: @organization, offices: [@office])
      visit people_path
    end
  
    it "displays people" do
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
      select @office.name, :from => "person_people_offices_attributes_0_office_id"
      #click_link "Add an Office"
      select @org_1.name, :from => "person_organization_id"
      find('#save').click
      #first(:button, "Save").click
      sleep 5
    end
  end
end
