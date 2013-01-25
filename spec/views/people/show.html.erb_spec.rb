require 'spec_helper'

describe "people/show" do
  before(:each) do
    @org_1 = FactoryGirl.create(:organization)
    @office = FactoryGirl.create(:office)
    @person = FactoryGirl.create(:person, offices: [@office], organization: @org_1)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #rendered.should match(/Name Offices Organization/)
    pending
  end
end
