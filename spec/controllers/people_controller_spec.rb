require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PeopleController do

  # This should return the minimal set of attributes required to create a valid
  # Person. As you add validations to Person, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {first_name: "First Name", middle_name: "Middle Name", last_name: "Last Name", offices_attributes: {"0" => {office: {id: @office.id}}}, organization_attributes: {organization: {id: @organization}}}
  end
  
  def invalid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PeopleController. Be sure to keep this updated too.
  def valid_session
    {}
  end
  
  before(:each) do
    @office = FactoryGirl.create(:office)
    @organization = FactoryGirl.create(:organization)
  end

  describe "index" do
    before(:each) do
      @org_0 = FactoryGirl.create(:organization)
      @org_1 = FactoryGirl.create(:organization, name: "B", parent: @org_0)
      @org_2 = FactoryGirl.create(:organization, name: "C", parent: @org_0)
      @org_3 = FactoryGirl.create(:organization, name: "A", parent: @org_0)
    
      @person_1 = FactoryGirl.create(:person, first_name: "Jerome", middle_name: "Garcia", last_name: "Charles", organization: @org_1)
      @person_2 = FactoryGirl.create(:person, first_name: "Bob", middle_name: "Antonov", last_name: "Aaron", organization: @org_2)
      @person_3 = FactoryGirl.create(:person, first_name: "Ash", middle_name: "Zulueta",last_name: "Baron", organization: @org_3)
    end
    
    it "assigns all people as @people AND defaultly sorts @people in Person.last_name alphabetic order" do
      get :index, {}, valid_session
      assigns(:people).should eq([@person_2, @person_3, @person_1])
    end
    
    it "sorts all people alphabetically by last_name" do
      get :index, {search: {meta_sort: => "last_name.asc"}}, valid_session
      assigns(:people).should eq([@person_2, @person_3, @person_1])
      
      get :index, {search: {meta_sort: => "last_name.desc"}}, valid_session
      assigns(:people).should eq([@person_1, @person_3, @person_2])
    end
    
    it "sorts all people alphabetically by first_name" do
      get :index, {:q =>{:s => "first_name asc"}}, valid_session
      assigns(:people).should eq([@person_3, @person_2, @person_1])
      
      get :index, {:q =>{:s => "first_name desc"}}, valid_session
      assigns(:people).should eq([@person_1, @person_2, @person_3])
    end
    
    it "sorts all people alphabetically by middle_name" do
      get :index, {:q =>{:s => "middle_name asc"}}, valid_session
      assigns(:people).should eq([@person_2, @person_1, @person_3])
      
      get :index, {:q =>{:s => "middle_name desc"}}, valid_session
      assigns(:people).should eq([@person_3, @person_1, @person_2])
    end
    
    it "sorts all people alphabetically by sub-organization name" do
      get :index, {:q =>{:s => "organizations.name asc"}}, valid_session
      assigns(:people).should eq([@person_3, @person_1, @person_2])
      
      get :index, {:q =>{:s => "organizations.name desc"}}, valid_session
      assigns(:people).should eq([@person_2, @person_1, @person_3])
    end
    
    it "filters all people by sub-organization" do
      get :index, {:organization => @org1.id}, valid_session
      assigns(:people).should eq([@person_1])
    end
    
    it "filters all people by office" do
      get :index, {:office => Office.finance.to_param}, valid_session
      assigns(:people).should eq([@person_3])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      person = FactoryGirl.create(:person)
      get :show, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      get :new, {}, valid_session
      assigns(:person).should be_a_new(Person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      person = FactoryGirl.create(:person)
      get :edit, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, {:person => valid_attributes}, valid_session
        }.to change(Person, :count).by(1)
      end

      it "assigns a newly created person as @person" do
        post :create, {:person => valid_attributes}, valid_session
        assigns(:person).should be_a(Person)
        assigns(:person).should be_persisted
      end

      it "redirects to the created person" do
        post :create, {:person => valid_attributes}, valid_session
        response.should redirect_to(Person.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        # Trigger the behavior that occurs when invalid params are submitted
        Person.any_instance.stub(:save).and_return(false)
        post :create, {person: invalid_attributes }, valid_session
        assigns(:person).should be_a_new(Person)
      end

      it "outputs the error messages" do
        pending
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested person" do
        person = FactoryGirl.create(:person)
        # Assuming there are no other people in the database, this
        # specifies that the Person created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Person.any_instance.should_receive(:update_attributes).with({ "last_name" => "MyString" })
        put :update, {:id => person.to_param, :person => { "last_name" => "MyString" }}, valid_session
      end

      it "assigns the requested person as @person" do
        person = Person.create! valid_attributes
        put :update, {:id => person.to_param, :person => valid_attributes}, valid_session
        assigns(:person).should eq(person)
      end

      it "redirects to the person" do
        person = Person.create! valid_attributes
        put :update, {:id => person.to_param, :person => valid_attributes}, valid_session
        response.should redirect_to(person)
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        person = FactoryGirl.create(:person)
        # Trigger the behavior that occurs when invalid params are submitted
        Person.any_instance.stub(:save).and_return(false)
        put :update, {:id => person.to_param, :person => { "last_name" => "invalid value" }}, valid_session
        assigns(:person).should eq(person)
      end

      it "re-renders the 'edit' template" do
        person = Person.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Person.any_instance.stub(:save).and_return(false)
        put :update, {:id => person.to_param, :person => { "last_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      person = Person.create! valid_attributes
      expect {
        delete :destroy, {:id => person.to_param}, valid_session
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      person = Person.create! valid_attributes
      delete :destroy, {:id => person.to_param}, valid_session
      response.should redirect_to(people_url)
    end
  end

end
