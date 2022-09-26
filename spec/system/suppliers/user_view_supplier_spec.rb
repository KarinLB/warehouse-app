require 'rails_helper'

describe 'Usuário vê fornecedores' do
    it 'a partir do menu' do
        #Arrange

        #Act
        visit root_path
        within('nav') do
            click_on 'Fornecedores'
        end

        #Assert
        expect(current_path).to eq suppliers_path
    end

    it 'com sucesso' do
        #Arrange
        Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                        full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')
        Supplier.create!(corporate_name: 'Varejo LS LTDA', brand_name: 'VLS', registration_number: '84623950000162', 
                            full_address: 'Avenida Afonso Pena, 1000', city: 'Belo Horizonte', state: 'MG', email: 'ls.varejo@gmail.com')

        #Act
        visit root_path
        click_on 'Fornecedores'

        #Assert
        expect(page).to have_content('Fornecedores')
        expect(page).to have_content('UNI')
        expect(page).to have_content('Campinas - SP')
        expect(page).to have_content('VLS')
        expect(page).to have_content('Belo Horizonte - MG')
    end

    it 'e não existem fornecedores cadastrados' do
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'

        #Assert
        expect(page).to have_content('Não existem fornecededores cadastrados')
    end
end