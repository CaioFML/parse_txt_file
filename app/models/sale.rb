class Sale < ApplicationRecord
  belongs_to :buyer, class_name: "Person", foreign_key: "buyer_id"
  belongs_to :provider, class_name: "Person", foreign_key: "provider_id"

  has_one :product
end
