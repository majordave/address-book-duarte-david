class Phone < ApplicationRecord
    belongs_to :person

    validates :phoneNumber, presence: true
end
