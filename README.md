# テーブル設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| kana_family_name   | string              | null: false               |
| kana_first_name    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

- has_many :items
- has_many :orders


## items table

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| name                 | string      | null: false                    |
| information          | text        | null: false                    |
| category_id          | integer     | null: false                    |
| condition_id         | integer     | null: false                    |
| delivery_fee_id      | integer     | null: false                    |
| prefecture_id        | integer     | null: false                    |
| delivery_days_id     | integer     | null: false                    |
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category_id
- belongs_to :condition_id
- belongs_to :delivery_fee_id
- belongs_to :prefecture_id
- belongs_to :delivery_days_id
- has_one :order


## order table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |

### Association

- belongs_to :order
- belongs_to :prefecture_id