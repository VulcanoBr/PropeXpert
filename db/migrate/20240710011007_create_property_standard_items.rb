class CreatePropertyStandardItems < ActiveRecord::Migration[7.1]
  def change
    create_table :property_standard_items do |t|
      t.string :name, null: false, limit: 100

      t.timestamps
    end
  end
end
