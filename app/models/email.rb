class Email < ApplicationRecord
    belongs_to :person

    validates :emailAddress, presence: true
end
