class AddDescriptionToGigs < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :description, :string
  end
end
