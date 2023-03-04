class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :emailAddress
      t.string :comment

      t.belongs_to :person, foreign_key: true

      t.timestamps
    end
  end
end
