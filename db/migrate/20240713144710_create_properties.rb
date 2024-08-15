class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :title, limit: 200
      t.integer :size
      t.integer :bedroom_count
      t.integer :bathroom_count

      t.timestamps
    end
  end
end
