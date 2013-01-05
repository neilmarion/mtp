class OfficesController < ApplicationController
  def get_children
    @offices = Office.find(params[:id]).children
    
    respond_to do |format|
      format.json { render json: @offices }
      format.js
    end
  end
  
  def get_roots
    @offices = Office.roots
    
    respond_to do |format|
      format.json { render json: @offices }
      format.js
    end
  end
end
