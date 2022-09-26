require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
    it 'a partir do menu' do
        #Arrange
        
        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo Fornecedor'

        #Assert
        expect(page).to have_field('Nome Fantasia')
        expect(page).to have_field('Razão Social')
        expect(page).to have_field('CNPJ')
        expect(page).to have_field('Endereço')
        expect(page).to have_field('Cidade')
        expect(page).to have_field('Estado')
        expect(page).to have_field('E-mail')
    end

    it 'com sucesso' do
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo Fornecedor'
        fill_in 'Nome Fantasia', with: 'UNI'
        fill_in 'Razão Social', with: 'Unidas LTDA'
        fill_in 'CNPJ', with: '74251050000188'
        fill_in 'Endereço', with: 'Avenida Brasil, 2000'
        fill_in 'Cidade', with: 'Campinas'
        fill_in 'Estado', with: 'SP'
        fill_in 'E-mail', with: 'unidas@gmail.com'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content('Fornecedor cadastrado com sucesso')
        expect(page).to have_content('Unidas LTDA')
        expect(page).to have_content('CNPJ: 74251050000188')
        expect(page).to have_content('Endereço: Avenida Brasil, 2000 - Campinas - SP')
        expect(page).to have_content('E-mail: unidas@gmail.com')
    end

    it '' do
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo Fornecedor'
        fill_in 'Nome Fantasia', with: ''
        fill_in 'Razão Social', with: ''
        fill_in 'CNPJ', with: ''
        fill_in 'Endereço', with: ''
        fill_in 'Cidade', with: ''
        fill_in 'Estado', with: ''
        fill_in 'E-mail', with: ''
        click_on 'Enviar'

        #Assert
        expect(page).to have_content('Fornecedor não cadastrado')
        expect(page).to have_content('Nome Fantasia não pode ficar em branco')
        expect(page).to have_content('Razão Social não pode ficar em branco')
        expect(page).to have_content('CNPJ não pode ficar em branco')
        expect(page).to have_content('E-mail não pode ficar em branco')
    end
end