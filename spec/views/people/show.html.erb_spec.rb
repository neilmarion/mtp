require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :last_name => "Last Name",
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :office_id => 1,
      :organization_id => 2,
      :birth_date => "Birth Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    rendered.should match(/First Name/)
    rendered.should match(/Middle Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Birth Date/)
  end
end
