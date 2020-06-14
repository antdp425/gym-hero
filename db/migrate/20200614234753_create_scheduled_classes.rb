class CreateScheduledClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_classes do |t|
      t.references :member, null: false, foreign_key: true
      t.references :gym, null: false, foreign_key: true
      t.references :gym_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
