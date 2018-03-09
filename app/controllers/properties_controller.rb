class PropertiesController < ApplicationController
  def show
    @property = Property.find_by(id: params[:id])

    if @property.nil?
      redirect_to root_path
    end
  end

  def new
    @property = Property.new
  end

  def create
    property_params = params.require(:property).permit(:title, :description,
                      :property_location, :neighborhood, :main_photo,
                      :rent_purpose, :rooms, :maximum_guests, :minimum_rent,
                      :maximum_rent, :daily_rate, :accessibility, :allow_pets,
                      :allow_smokers)
    @property = Property.new(property_params)
    @property.save
    redirect_to @property
  end
end
