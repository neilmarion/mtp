require 'spec_helper'

describe "People", :js => :true do
  before(:each) do
    #@office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
    @child = FactoryGirl.create(:organization, parent: @organization)
  end
  
  describe "GET /people" do
    it "displays people" do
      person = FactoryGirl.create(:person)
      visit people_path
      page.should have_content(person.first_name)
    end
  end
end
