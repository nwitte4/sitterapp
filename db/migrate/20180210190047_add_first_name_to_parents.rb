class AddFirstNameToParents < ActiveRecord::Migration[5.1]
  def change
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
    add_column :parents, :number_of_children, :integer
  end
end
