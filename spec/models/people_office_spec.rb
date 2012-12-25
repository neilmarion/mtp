require 'spec_helper'

describe PeopleOffice do
  it { should belong_to(:person) }
  it { should belong_to(:office) }
end
