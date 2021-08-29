FactoryBot.define do
  factory :address do
    postal_code     { '123-4567' }
    ship_from_id    { 2 }
    city            { '旭川市' }
    block           { '1-1' }
    phone_number    { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
