## Userテーブル

| column   | type   | option      |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association
- has_many :groups
- has_many :comments

## Groupテーブル

| column  | type       | option                         |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| comment | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many :comments
- has_one :schedule

## Scheduleテーブル

| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| day    | string     | null: false                    |
| time   | string     | null: false                    |
| plan   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| group  | references | null: false, foreign_key: true |

## Association
- belongs_to :group

## Commentテーブル

| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| group  | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :group
