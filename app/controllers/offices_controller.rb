class OfficesController < ApplicationController
  def get_children
    @offices = Office.find(params[:id]).children
    
    respond_to do |format|
      format.json { render json: @offices }
      format.js
    end
  end

end
