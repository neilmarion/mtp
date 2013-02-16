require 'spec_helper'

describe "People", :js => :true do
  before(:each) do
    @office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
    @child_organization = FactoryGirl.create(:organization, parent: @organization)
    @user = FactoryGirl.create(:user, organization: @child_organization)
    
    visit new_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button "Log in"
    
    page.set_rack_session(:user_id => @user.id)
  end

  describe "GET /people" do
    before(:each) do
      @person = FactoryGirl.create(:person, organization: @child_organization, offices: [@office])
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
      select @child_organization.name, :from => "person_organization_id"
      click_button "Save and close"
    end
  end
  
  describe "DELETE /people" do
    before(:each) do
      @person = FactoryGirl.create(:person, organization: @child_organization, offices: [@office])
      visit people_path
    end
  
    it "deletes people" do
      expect {
        my_link = find(:xpath, "//a[contains(@href,'/people/1')]")
        my_link.click
        page.driver.browser.switch_to.alert.accept
      }.to change(Person, :count).by -1
    end
  end
end
