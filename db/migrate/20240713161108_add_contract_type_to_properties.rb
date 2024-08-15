class AddContractTypeToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :contract_type, :string, limit: 20, default: 'rent'
  end
end
