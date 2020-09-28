class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :description
      t.float :unit_price
      t.integer :quantity
    end
  end
end
