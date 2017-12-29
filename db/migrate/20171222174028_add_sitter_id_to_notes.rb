class AddSitterIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :sitter_id, :integer
  end
end
