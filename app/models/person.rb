class Person < ApplicationRecord
    has_many :addresses
    has_many :emails
    has_many :phones

    validates :salutation, presence: true
    validates :firstName, presence: true
    validates :lastName, presence: true

    def fullName
        [salutation, firstName, middleName, lastName].select(&:present?).join(' ').titleize
    end
end
