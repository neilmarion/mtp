require 'spec_helper'

describe OfficesController do

  describe "GET /get_roots" do
    it "only gets offices that have no parent" do
      a = Array.new
      3.times { a << FactoryGirl.create(:office) }
      FactoryGirl.create(:office, parent: Office.last)
      FactoryGirl.create(:office, parent: Office.first)
      
      get :get_roots
      assigns(:offices).should eq a
    end
  end
  
end
