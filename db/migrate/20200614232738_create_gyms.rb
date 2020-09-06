class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.text :name
      t.text :email
      t.text :password_digest
      t.text :uid
      t.text :provider_name
      t.boolean :using_provider

      t.timestamps
    end
  end
end
