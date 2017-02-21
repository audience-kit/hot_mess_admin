class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.timestamps null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :display_name, null: false
      t.string :facebook_token
      t.string :facebook_refresh_token
      t.boolean :is_admin, null: false, default: false
    end
  end
end
