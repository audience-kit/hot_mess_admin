class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.integer :locale_id
      t.string :name
      t.string :display_name
      t.string :google_pace_id
      t.string :facebook_place_id
    end
  end
end
