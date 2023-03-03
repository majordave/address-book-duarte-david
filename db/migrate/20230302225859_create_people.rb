class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :ssn
      t.date :birthDate
      t.string :comment

      t.timestamps
    end
  end
end
