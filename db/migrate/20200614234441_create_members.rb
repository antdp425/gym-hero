class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :phone_number
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
