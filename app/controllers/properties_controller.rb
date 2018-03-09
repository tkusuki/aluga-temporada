class PropertiesController < ApplicationController
  def show
    @property = Property.find_by(params[:id])

    if @property.nil?
      redirect_to root_path
    end
  end
end
