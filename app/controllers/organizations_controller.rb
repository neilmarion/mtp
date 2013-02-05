class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.json
  before_filter :get_root_organization, only: [:index]
  
  def index
    @organizations = @root_org.children
    @organization = Organization.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    begin
      @organization = Organization.find params[:id]
    rescue ActiveRecord::RecordNotFound => e
      @organization = nil
    end

    respond_to do |format|
      format.js
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])
    @parent = Organization.find(params[:organization][:parent_id])

    respond_to do |format|
      if @organization.save
        format.js
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.js
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to organizations_path, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def get_children
    @organizations = Organization.find(params[:id]).children
    
    respond_to do |format|
      format.json { render json: @organizations }
      format.js # new.html.erb
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end
  
  def set_current
    session[:current_organization_id] = params[:id]
    redirect_to people_url
  end
  
  protected
  
  def get_root_organization
    @root_org = Organization.first
  end
end
