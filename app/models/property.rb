class Property < ApplicationRecord
  validates :title, :description, :property_location, :neighborhood, :main_photo,
            :rooms, :maximum_guests, :minimum_rent, :maximum_rent, :daily_rate,
            presence: { message: 'Você deve preencher todos os campos obrigatórios' }
end
