class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  #has_one :purchase_info

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from
  belongs_to :shipping_days

  with_options presence: true do
    validates :product_name
    validates :image
    validates :price
    validates :description
    validates :image
  end

  validates :category_id, :condition_id, :delivery_fee_id, :ship_from_id, :shipping_days_id,
            numericality: { other_than: 1, message: 'Select' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' }

  def was_attached?
    image.attached?
  end
end
