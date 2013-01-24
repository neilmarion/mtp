require 'spec_helper'

describe Organization do
  it { should have_many(:people) }
  
  it { should validate_presence_of(:name) }
  
  before(:each) do
      expect {
        expect {
          expect {
            expect {
              offices = Array.new
              @organization = FactoryGirl.create(:organization)
              2.times { offices << FactoryGirl.create(:office) }
              2.times { FactoryGirl.create(:person, offices: offices, organization: @organization) }
            }.to change(Organization, :count).by(1)
          }.to change(Office, :count).by(2)
        }.to change(PeopleOffice, :count).by(4)
      }.to change(Person, :count).by(2)
  end
  
  it "destroy related PeopleOffice" do
    expect {
      expect {
        @organization.destroy
      }.to change(Person, :count).by(-2)
    }.to change(PeopleOffice, :count).by(-4)
  end
end
