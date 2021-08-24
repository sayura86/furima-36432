FactoryBot.define do
  factory :item do
    product_name     { '花子' }
    description      { '説明' }
    category_id      { 2 }
    condition_id     { 2 }
    delivery_fee_id  { 2 }
    ship_from_id     { 2 }
    shipping_days_id { 2 }
    price            { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
