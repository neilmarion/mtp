require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:root_org,
      stub_model(Organization,
        :name => "Root", :type_of_children => "Child"
      ),
    )
    
    assign(:organization,
      stub_model(Organization,
        :name => "", :type_of_children => ""
      ),
    )
  
    assign(:organizations, [
      stub_model(Organization,
        :name => "Child_1", :type_of_children => "Child"
      ),
      stub_model(Organization,
        :name => "Child_2", :type_of_children => "Child"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    pending
  end
end
