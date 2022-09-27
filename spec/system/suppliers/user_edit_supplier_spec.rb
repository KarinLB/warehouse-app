require 'rails_helper'
describe 'Usuario edita um fornecedor' do
    it '' do
        #Arrange
        supplier = Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                            full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com', telephone: '40028922')

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'UNI'
        click_on 'Editar'

        #Assert
        expect(page).to have_content 'Editar Fornecedor'
        expect(page).to have_field('Razão Social', with: 'Unidas LTDA')
        expect(page).to have_field('Nome Fantasia', with: 'UNI')
        expect(page).to have_field('CNPJ', with: '74251050000188')
        expect(page).to have_field('Endereço', with: 'Avenida Brasil, 2000')
        expect(page).to have_field('Cidade', with: 'Campinas' )
        expect(page).to have_field('Estado', with: 'SP')
        expect(page).to have_field('E-mail', with: 'unidas@gmail.com')
        expect(page).to have_field('Telefone', with: '40028922')
    end

    #it 'com sucesso' do
        #Arrange
        #supplier = Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                        # full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com', telephone: '40028922')

        #Act
        #visit root_path
        #click_on 'Fornecedores'
        #click_on 'UNI'
        #click_on 'Editar'
        #fill_in 'Razão Social',	with: 'Unidos Varejo'
        #fill_in 'Nome Fantasia', with: 'UDV'
        #fill_in 'Endereço', with: 'Avenida Brasil, 3000'
        #fill_in 'CNPJ', with: '74251050000199'
        #click_on 'Enviar'

        #Assert
        #expect(page).to have_content 'Fornecedor Atualizado com sucesso'
        #expect(page).to have_content 'Razão Social: Unidos Varejo'
        #expect(page).to have_content 'Nome Fantasia: UDV'
        #expect(page).to have_content 'Endereço: Avenida Brasil, 3000'
        #expect(page).to have_content 'CNPJ 74251050000199'

    #end

    it 'e mantém os campos obrigatórios' do
        #Arrange
        supplier = Supplier.create!(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                         full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com', telephone: '40028922')

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'UNI'
        click_on 'Editar'
        fill_in 'Razão Social',	with: ''
        fill_in 'Nome Fantasia', with: ''
        fill_in 'Endereço', with: ''
        fill_in 'CNPJ', with: ''
        click_on 'Enviar'

        #Assert
        expect(page).to have_content 'Não foi possível atualizar fornecedor'
    end
end