class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  before_filter :get_parent_offices, only: [:index, :create, :edit]
  before_filter :get_second_level_orgs, only: [:index, :create, :edit]
  
  
  def index
    
    
    if params[:commit] == I18n.t('general.search')
      filter 
    else
      @q = Person.search(params[:search])
    end
    
    
    
    
    @people = @q.paginate(:page => params[:page], :per_page => 20)
    @person = Person.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
      format.js
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.js
        format.json { render json: @person, status: :created, location: @person }
      else
        format.js
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    @person.delete_offices
    @person.delete_addresses
    @person.delete_phone_numbers

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.js
      format.json { head :no_content }
    end
  end
  
  protected
  
  def filter
    if params[:cfo_id]
      @q = Person.where(cfo_id: params[:cfo_id])
    end
    
    @q = @q.search(params[:search])
  end
  
  def get_second_level_orgs
    @organizations = Organization.first.children
  end
  
  def get_parent_offices
    @offices = Office.roots
  end
end
