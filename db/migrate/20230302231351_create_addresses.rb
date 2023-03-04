class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :town
      t.string :zipCode
      t.string :state
      t.string :country

      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
