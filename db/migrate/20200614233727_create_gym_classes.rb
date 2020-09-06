class CreateGymClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :gym_classes do |t|
      t.text :name
      t.text :description
      t.integer :duration
      t.integer :max_size
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
