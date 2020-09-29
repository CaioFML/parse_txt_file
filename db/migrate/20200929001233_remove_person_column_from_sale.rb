class RemovePersonColumnFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :person_id
  end
end
