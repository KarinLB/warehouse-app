require 'rails_helper'

RSpec.describe Supplier, type: :model do
    describe '#valid?' do
        context "presence" do
        it 'false when corporate_name is empty' do
            #Arrange
            supplier = Supplier.new(corporate_name: '', brand_name: 'UNI', registration_number: '74251050000188', 
                full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')

            #Act with
            result = supplier.valid?

            #Assert
            expect(result).to eq false
                
            end

            it 'false when brand_name is empty' do
                #Arrange
                supplier = Supplier.new(corporate_name: 'Unidas LTDA', brand_name: '', registration_number: '74251050000188', 
                    full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')
    
                #Act with
                result = supplier.valid?
    
                #Assert
                expect(result).to eq false
            end
        end

        it 'false when registration_number in use' do
            #Arrange
            first_supplier = Supplier.create(corporate_name: 'Unidas LTDA', brand_name: 'UNI', registration_number: '74251050000188', 
                                          full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')
            second_supplier = Supplier.new(corporate_name: 'Varejo LS LTDA', brand_name: 'VLS', registration_number: '74251050000188', 
                                           full_address: 'Avenida Afonso Pena, 1000', city: 'Belo Horizonte', state: 'MG', email: 'ls.varejo@gmail.com')
                                                
            #Act
            result = second_supplier.valid?

            #Assert
            expect(result).to eq false
        end

        it 'false when registration_number is not in the correct format' do
            #Arrange
            supplier = Supplier.new(corporate_name: 'Unidas LTDA', brand_name: '', registration_number: '74251050000188', 
                                full_address: 'Avenida Brasil, 2000', city: 'Campinas', state: 'SP', email: 'unidas@gmail.com')

            #Act
            result = supplier.valid?

            #Assert
            expect(result).to eq false
        end
    end
end
