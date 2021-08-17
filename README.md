## Users

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false                    |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | date   | null: false                    |

- has_many :items
- has_one :cards
- has_one :purchases


## Items

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| product_name  | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| ship_from     | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

- belongs_to :user


## purchases

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| bulding      | string     | null: false                    |
| phone_number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

- has_one :cards
- belongs_to :user



## Cards

| Column      | Type       | Options        |
| ----------- | ---------- | -------------- |
|user_id      | references | null: false    |
|card_id      | references | null: false    |
|customer_id  | references | null: false    |

- belongs_to :user
- belongs_to :purchases
