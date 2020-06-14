class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :provider_name
      t.boolean :using_provider

      t.timestamps
    end
  end
end
