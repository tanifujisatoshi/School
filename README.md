# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| occupation         | text   | null: false | 

### Association

- has_many :lunches
- has_many :comments

## lunches テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| image              |           |             |
| user               | reference |             |
| soup               | text      | null: false |
| staple food        | text      | null: false |
| main dish          | text      | null: false |
| side dish          | text      | null: false |
| drink              | text      | null: false |
| other              | text      | null: false |

### Association

- has_many :comments
- belongs_to :user
 
## comments テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| text               | text      | null: false |
| user               | references|             |
| lunch              | references|             |

### Association

- belongs_to :lunch
- belongs_to :user
