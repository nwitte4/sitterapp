class AddDescriptionToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :description, :string
  end
end
