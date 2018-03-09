require 'rails_helper'

feature 'User view property details' do
  scenario 'successfully' do
    # cria os dados necessários
    property = create_property('Casa de Campo')

    # simula a ação do usuário
    visit property_path(property)

    # expectivas do usuário após ação
    expect(page).to have_css('h1', text: property.title)
    expect(page).to have_css('h3', text: property.main_photo)
    expect(page).to have_css('h3', text: 'Descrição completa')
    expect(page).to have_css('p', text: property.description)
    expect(page).to have_css('li', text: "Localização: #{property.property_location}")
    expect(page).to have_css('li', text: "Bairro: #{property.neighborhood}")
    expect(page).to have_css('li', text: "Finalidades do imóvel: #{property.rent_purpose}")
    expect(page).to have_css('li', text: "Quartos: #{property.rooms}")
    expect(page).to have_css('li', text: "Acomoda até: #{property.maximum_guests} pessoas")
    expect(page).to have_css('li', text: "Dias mínimos para locação: #{property.minimum_rent}")
    expect(page).to have_css('li', text: "Dias máximos para locação: #{property.maximum_rent}")
    expect(page).to have_css('li', text: "Preço da diária: R$ #{property.daily_rate}")
    expect(page).to have_css('li', text: "Acessibilidade: Sim")
    expect(page).to have_css('li', text: "Aceita animais: Sim")
    expect(page).to have_css('li', text: "Aceita fumantes: Sim")
    expect(page).to have_link('Voltar')

  end

  scenario 'from an invalid property' do

    # simula a ação do usuário
    visit property_path(-999)

    # expectivas do usuário após ação
    expect(current_path).to eq(root_path)

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
