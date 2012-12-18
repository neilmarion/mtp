require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :last_name => "Last Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :office_id => 1,
        :organization_id => 2,
        :birth_date => "Birth Date"
      ),
      stub_model(Person,
        :last_name => "Last Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :office_id => 1,
        :organization_id => 2,
        :birth_date => "Birth Date"
      )
    ])
  end
  
  it "renders top menu" do
    render :template => "people/index", :layout => "layouts/application"
  
    assert_select "div", :text => "People"
  end
end
