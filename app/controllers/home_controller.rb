class HomeController < ApplicationController
  def index
    num_property = 10
    @properties = Property.order(created_at: :desc).limit(num_property)
  end
end
