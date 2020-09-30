class Product < ApplicationRecord
  belongs_to :sale

  def amount
    unit_price * quantity
  end
end
