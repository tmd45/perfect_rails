class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider,  null: false
      t.string :uid,       null: false
      t.string :nickname,  null: false
      t.string :image_url, null: false

      t.timestamps
    end

    add_index :users, [ :provider, :uid ], unique: true, name: :index_provider_uid
  end
end
