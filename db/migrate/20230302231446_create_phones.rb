class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phoneNumber
      t.string :comment

      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
