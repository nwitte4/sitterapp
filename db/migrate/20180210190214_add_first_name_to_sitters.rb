class AddFirstNameToSitters < ActiveRecord::Migration[5.1]
  def change
    add_column :sitters, :first_name, :string
    add_column :sitters, :last_name, :string
  end
end
