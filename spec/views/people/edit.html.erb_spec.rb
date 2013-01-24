require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :last_name => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :office_id => 1,
      :organization_id => 1,
      :birth_date => "MyString"
    ))
    
    
    
    @org_0 = FactoryGirl.create(:organization)
    FactoryGirl.create(:organization, parent: @org_0)
    assign(:organizations, @org_0.children)
    
    assign(:offices, [FactoryGirl.create(:office)])
    
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_last_name", :name => "person[last_name]"
      assert_select "input#person_first_name", :name => "person[first_name]"
      assert_select "input#person_middle_name", :name => "person[middle_name]"
      assert_select "select#person_people_offices_attributes_0_office_id", :name => "person[people_offices_attributes][0][office_id]"
      assert_select "select#person_organization_id", :name => "person[organization_id]"
    end
  end
end
