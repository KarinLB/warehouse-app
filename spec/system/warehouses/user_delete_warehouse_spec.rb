require 'rails_helper'

describe 'Usuário remove um galpão' do
    it 'com sucesso' do
        #Arrange
        w = Warehouse.create!(name: 'Cuiaba', code: 'CWB', area: 10000, cep: '56000000', city: 'Cuiaba', description: 'Galpão no centro do pais', address: 'Av dos Jacarés, 1000')

        #Act
        visit root_path
        click_on 'Cuiaba'
        click_on 'Remover'

        #Assert
        expect(current_path).to eq root_path
        expect(page).to have_content 'Galpão removido com sucesso'
        expect(page).not_to have_content 'Cuiaba'
        expect(page).not_to have_content 'CWB'
    end

    it 'e não apaga outros galpões' do
        #Arrange
        first_warehouse = Warehouse.create!(name: 'Cuiaba', code: 'CWB', area: 10000, cep: '56000000', city: 'Cuiaba', description: 'Galpão no centro do pais', address: 'Av dos Jacarés, 1000')
        second_warehouse = Warehouse.create!(name: 'Belo Horizonte', code: 'BHZ', area: 20000, cep: '46000000', city: 'Belo Hoeizonte', description: 'Galpão para cargas mineiras', address: 'Av Tiradentes, 20')


        #Act
        visit root_path
        click_on 'Cuiaba'
        click_on 'Remover'

        #Assert
        expect(current_path).to eq root_path
        expect(page).to have_content 'Galpão removido com sucesso'
        expect(page).to have_content 'Belo Horizonte'
        expect(page).not_to have_content 'Cuiaba'
    end
end