class CreateLocales < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :locales, id: :uuid do |t|
      t.timestamps null: false
      t.string :name, null: false, index: true
      t.string :display_name, null: false
      t.string :google_place_id
      t.string :facebook_location_id
    end
  end
end
