require 'spec_helper'

describe Office do
  it { should have_many(:people) }
  it { should have_many(:people_offices) }
  
  it { should validate_presence_of(:name) }
end
