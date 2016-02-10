class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :display_name
      t.integer :venue_id
    end
  end
end
