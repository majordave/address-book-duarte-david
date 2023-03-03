class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phoneNumber
      t.string :comment

      t.timestamps
    end
  end
end
