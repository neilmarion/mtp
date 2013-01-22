require 'spec_helper'

describe "organizations/edit" do
  before(:each) do
    @org_1 = FactoryGirl.create(:organization)
    @org_2 = FactoryGirl.create(:organization, parent: @org_1)
    assign(:organization, @org_2)
  end

  it "renders the edit organization form" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edit_organization_path(@org_2), :method => "get" do
      assert_select "input#organization_name", :name => "organization[name]"
    end
  end
end
