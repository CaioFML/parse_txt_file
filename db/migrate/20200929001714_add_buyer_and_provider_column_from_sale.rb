class AddBuyerAndProviderColumnFromSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :buyer_id, :integer
    add_column :sales, :provider_id, :integer
  end
end
