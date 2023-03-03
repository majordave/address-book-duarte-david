class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :emailAddress
      t.string :comment

      t.timestamps
    end
  end
end
