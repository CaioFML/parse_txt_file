class CreateSale < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :person, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
