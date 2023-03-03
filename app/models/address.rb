class Address < ApplicationRecord
    belongs_to :person

    validates :street, presence: true
    validates :town, presence: true
    validates :zipCode, presence: true
    validates :country, presence: true
end
