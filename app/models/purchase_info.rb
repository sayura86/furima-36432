class PurchaseInfo < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :Shipping_address
end
