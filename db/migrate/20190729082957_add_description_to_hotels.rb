class AddDescriptionToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :description, :string
  end
end
