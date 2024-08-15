class CreatePropertyLinkedItems < ActiveRecord::Migration[7.1]
  def change
    create_table :property_linked_items do |t|
      t.references :property, null: false, foreign_key: true
      t.references :property_standard_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
