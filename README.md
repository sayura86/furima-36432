## Users

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | date   | null: false                    |

- has_many :items
- has_many :Shipping_addresses
- has_many :Purchase_info


## Items

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| ship_from_id     | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase_info


## Shipping_addresses

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| bulding       | string     |                                |
| phone_number  | string     | null: false                    |

- belongs_to :purchase_info
- belongs_to :user


## Purchase_info

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product             | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :Shipping_address