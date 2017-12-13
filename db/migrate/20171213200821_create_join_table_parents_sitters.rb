class CreateJoinTableParentsSitters < ActiveRecord::Migration[5.1]
  def change
    create_join_table :parents, :sitters do |t|
      t.index [:parent_id, :sitter_id]
      t.index [:sitter_id, :parent_id]
    end
  end
end
