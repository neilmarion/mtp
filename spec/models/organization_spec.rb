require 'spec_helper'

describe Organization do
  it { should have_many(:people) }
  
  it { should validate_presence_of(:name) }
end
