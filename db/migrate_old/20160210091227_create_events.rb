class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, id: :uuid do |t|
      t.timestamps
      t.string :name, null: false
      t.string :display_name, null: false
    end

    add_reference :events, :venue, type: :uuid, index: true, foreign_key: true
  end
end
