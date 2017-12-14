class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :cost
      t.integer :parent_id
      t.integer :sitter_id

      t.timestamps
    end
  end
end
