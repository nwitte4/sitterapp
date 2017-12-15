class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :sitter_email
      t.string :parent_email
      t.datetime :start_time
      t.datetime :end_time
      t.integer :cost

      t.timestamps
    end
  end
end
