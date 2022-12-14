class Warehouse < ApplicationRecord
    validates :name, :code, :city, :description, :address, :cep, :area, presence: true
    validates :name, :code, uniqueness: true
    validates :cep, length: {is: 8}
end
