# テーブル設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | primary_key               |
| password           | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |

### Association

- has_many :items
- has_many :orders


## items table

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| name                 | string      | null: false                    |
| image                | string      | null: false                    |
| explanation          | text        | null: false                    |
| category_id          | integer     | null: false                    |
| status_id            | integer     | null: false                    |
| postage_id           | integer     | null: false                    |
| prefecture_id        | integer     | null: false                    |
| shipping_day_id      | integer     | null: false                    |
| price                | integer     | null: false                    |
| user_id              | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## order table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | integer    | null: false, foreign_key: true |
| item_id     | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## deliveries table

| Column          | Type             | Options                         |
|-----------------|------------------|---------------------------------|
| postal_code     | string           | null: false                     |
| prefectures     | integer          | null: false                     |
| city            | string           | null: false                     |
| house_number    | string           | null: false                     |
| build_number    | string           |                                 |
| phone_number    | string           | null: false                     |
| orders_id       | integer          | null: false, foreign_key: true  |

### Association

- belongs_to :order