require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
    it 'a partir da tela inicial' do
        #Arrange
        Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                         full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'UNI'

        #Assert
        expect(page).to have_content('Unidas LTDA')
        expect(page).to have_content('UNI')
        expect(page).to have_content('74251050000188')
        expect(page).to have_content('Avenida Brasil, 2000 - Campinas - SP')
        expect(page).to have_content('unidas@gmail.com')
    end

    it 'e volta para a tela inicial' do
        #Arrange
        Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
            full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'UNI'
        click_on 'Voltar'

        #Assert
        expect(current_path).to eq root_path

    end
end