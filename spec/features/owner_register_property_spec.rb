require 'rails_helper'

feature 'Owner register a property' do
  scenario 'successfully' do

    # simula a ação do usuário
    visit root_path
    click_on 'Cadastrar um imóvel'

    fill_in 'Título', with: 'Casa de Campo'
    fill_in 'Descrição completa', with: 'Casa de campo isolada para dias tranquilos de descanso'
    fill_in 'Localização', with: 'Campos de Jordão'
    fill_in 'Bairro', with: 'Capivari'
    fill_in 'Foto principal', with: 'casa_de_campo.jpg'
    fill_in 'Finalidades do imóvel', with: 'Férias, Eventos'
    fill_in 'Quartos', with: 9
    fill_in 'Número máximo de hospedes', with: 9
    fill_in 'Dias mínimos para locação', with: 1
    fill_in 'Dias máximos para locação', with: 9
    fill_in 'Preço da diária', with: 99.9
    check 'Possui acessibilidade'
    check 'Aceita animais'
    click_on 'Enviar'

    # expectivas do usuário após ação
    expect(page).to have_css('h1', text: 'Casa de Campo')
    expect(page).to have_css('h3', text: 'casa_de_campo.jpg')
    expect(page).to have_css('h3', text: 'Descrição completa')
    expect(page).to have_css('p', text: 'Casa de campo isolada para dias tranquilos de descanso')
    expect(page).to have_css('li', text: "Localização: Campos de Jordão")
    expect(page).to have_css('li', text: "Bairro: Capivari")
    expect(page).to have_css('li', text: "Finalidades do imóvel: Férias, Eventos")
    expect(page).to have_css('li', text: "Quartos: 9")
    expect(page).to have_css('li', text: "Acomoda até: 9 pessoas")
    expect(page).to have_css('li', text: "Dias mínimos para locação: 1")
    expect(page).to have_css('li', text: "Dias máximos para locação: 9")
    expect(page).to have_css('li', text: "Preço da diária: R$ 99.9")
    expect(page).to have_css('li', text: "Acessibilidade: Sim")
    expect(page).to have_css('li', text: "Aceita animais: Sim")
    expect(page).to have_css('li', text: "Aceita fumantes: Não")
    expect(page).to have_link('Voltar')


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
