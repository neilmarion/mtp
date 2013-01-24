require 'spec_helper'

describe Person do
  it { should have_many(:people_offices) }
  it { should have_many(:offices) }
  it { should belong_to(:organization) }
  
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:organization) }
  
  before(:each) do
      expect {
        expect {
          expect {
            offices = Array.new
            organization = FactoryGirl.create(:organization)
            2.times { offices << FactoryGirl.create(:office) }
            @person = FactoryGirl.create(:person, offices: offices, organization: organization)
          }.to change(Organization, :count).by(1)
        }.to change(Office, :count).by(2)
      }.to change(Person, :count).by(1)
  end
  
  it "destroy related PeopleOffice" do
    expect {
      @person.destroy
    }.to change(PeopleOffice, :count).by(-2)
  end
  
end
