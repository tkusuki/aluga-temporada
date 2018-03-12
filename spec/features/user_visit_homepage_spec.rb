require 'rails_helper'

feature 'User visit homepage' do
  scenario 'and view the lastest 10 properties registered' do

    # cria os dados necessários
    first_property = create_property('Primeira casa')
    create_property('Casa 1')
    create_property('Casa 2')
    create_property('Casa 3')
    create_property('Casa 4')
    create_property('Casa 5')
    create_property('Casa 6')
    create_property('Casa 7')
    create_property('Casa 8')
    create_property('Casa 9')
    last_property = create_property('Casa 10')

    # simula a ação do usuário
    visit root_path

    # expectivas do usuário após ação
    expect(page).to have_css('h1', text: last_property.title)
    expect(page).to_not have_css('h1', text: first_property.title)

  end

  scenario 'but there is no property registered yet' do

    # simula a ação do usuário
    visit root_path

    # expectivas do usuário após ação
    expect(page).to have_content('Nenhum imóvel encontrado')

  end

  def create_property(title)
    Property.create(
      title: title,
      description: 'Casa de campo isolada para dias tranquilos de descanso',
      property_location: 'Campos de Jordão',
      neighborhood: 'Capivari',
      main_photo: 'casa_de_campo.jpg',
      rent_purpose: 'Férias em família',
      rooms: 9,
      maximum_guests: 9,
      minimum_rent: 1,
      maximum_rent: 9,
      daily_rate: 99.9,
      accessibility: true,
      allow_pets: true,
      allow_smokers: true,
    )
  end
end
