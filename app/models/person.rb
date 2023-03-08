class Person < ApplicationRecord
    has_many :addresses, dependent: :destroy_async
    has_many :emails, dependent: :destroy_async
    has_many :phones, dependent: :destroy_async

    validates :salutation, presence: true
    validates :firstName, presence: true
    validates :lastName, presence: true

    def fullName
        [salutation, firstName, middleName, lastName].select(&:present?).join(' ').titleize
    end
end
