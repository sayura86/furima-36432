class Address
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  validates :ship_from_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    purchase_info = PurchaseInfo.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, ship_from_id: ship_from_id, city: city, block: block, building: building,
                           phone_number: phone_number, purchase_info_id: purchase_info.id)
  end
end
