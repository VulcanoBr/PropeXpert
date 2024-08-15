class AddAddressFieldsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :address_zip_code, :string, limit: 9
    add_column :properties, :address_state, :string, limit: 2
    add_column :properties, :address_city, :string
    add_column :properties, :address_neighborhood, :string
    add_column :properties, :address_line_1, :string
    add_column :properties, :address_number, :string, limit: 10
    add_column :properties, :address_line_2, :string
  end
end
