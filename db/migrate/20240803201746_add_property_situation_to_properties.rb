class AddPropertySituationToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :property_situation, null: true, foreign_key: true
  end
end
