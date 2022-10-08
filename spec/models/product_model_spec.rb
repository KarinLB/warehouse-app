require 'rails_helper'

RSpec.describe ProductModel, type: :model do
    describe '#valid?' do
        it 'name is mandatory' do
            #Arrange
            supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA', registration_number: '58300678000170', 
                                        full_address: 'Av Nações Inidos, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsung.com.br')

            pm = ProductModel.new(name: '', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-XPTO90', supplier: supplier)

            #Act
            result = pm.valid?

            #Assert
            expect(result).to eq false
        end

        it 'sku is mandatory' do
            #Arrange
            supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA', registration_number: '58300678000170', 
                                        full_address: 'Av Nações Inidos, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsung.com.br')

            pm = ProductModel.new(name: 'TV32', weight: 8000, width: 70, height: 45, depth: 10, sku: '', supplier: supplier)

            #Act
            result = pm.valid?

            #Assert
            expect(result).to eq false
        end
    end
end
