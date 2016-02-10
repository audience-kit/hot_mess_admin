class CreateLocalesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :locales do |t|
      t.timestamps
      t.string :name, null: false
      t.string :display_name, null: false
      t.string :google_place_id
      t.string :facebook_location_id
    end
  end
end
