class AddParentIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :parent_id, :integer
  end
end
