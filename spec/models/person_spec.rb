require 'spec_helper'

describe Person do
  it { should have_many(:offices) }
  it { should belong_to(:organization) }
  
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  
end
