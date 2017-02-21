class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues, id: :uuid do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.string :display_name, null: false
      t.string :google_pace_id
      t.string :facebook_place_id
    end

    add_reference :venues, :locale, type: :uuid, index: true, foreign_key: true
  end
end
