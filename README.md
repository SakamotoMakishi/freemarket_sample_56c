# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



* ...





## usersテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|nickname         |string  |null: false                     |
|email            |string  |null: false ,unique: true       |
|password         |string  |null: false                     |

### Association
- has_many :items
- has_one :card
- has_one :address



## address_inputsテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|first_name       |string  |null: false                     |
|last_name        |string  |null: false                     |
|first_name_kana  |string  |null: false                     |
|last_name_kana   |string  |null: false                     |
|postal_code      |integer |null: false                     |
|prefectures      |string  |null: false                     |
|city             |string  |null: false                     |
|address          |string  |null: false                     |
|building_name    |string  |null: false                     |
|user_id          |integer |null: false ,foreign_key: true  |
|phone_num        |integer |null: false ,unique: true       |

### Association
- has_one :user



## itemsテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|name             |string  |null: false (,add_index)        |
|price            |integer |null: false                     |
|text             |text    |null: false                     |
|status           |string  |null: false                     |
|category_id      |integer |null: false ,foreign_key: true  |
|brand_id         |integer |null: false ,foreign_key: true  |
|seller_id        |integer |null: false ,foreign_key: true  |
|buyer_id         |integer |null: false ,foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one :delivery



## categoriesテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|name             |string  |null: false                     |
|parrent_id       |integer |null: false                     |

### Association
- has_many :items



## brandsテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|name             |string  |null: false                     |
|parrent_id       |integer |null: false                     |

### Association
- has_many :items



## delivariesテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|price            |integer |null: false                     |
|area             |string  |null: false                     |
|delivary_day     |integer |null: false                     |
|item_id          |integer |null: false ,foreign_key: true  |

### Association
- has_one :item



## cardsテーブル

|Column           |Type    |Options                         |
|-----------------|--------|--------------------------------|
|user_id          |integer |null: false ,foreign_key: true  |
|customer_id      |string  |null: false                     |
|card_id          |string  |null: false                     |

### Association
- has_one :user

