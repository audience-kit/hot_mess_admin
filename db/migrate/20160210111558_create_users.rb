class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :facebook_token
      t.string :facebook_refresh_token
    end
  end
end
