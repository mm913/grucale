
## usersテーブル

|Column                  |Type    |Options                   |
|------------------------|--------|--------------------------|
|name                    |string  |null: false               |
|email                   |string  |null: false, unique: true |
|encrypted_password      |string  |null: false               |
|affiliation_name        |string  |                          |
|department_name         |string  |                          |

### Association
- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :calendars
- has_many :comments



## groupsテーブル

|Column              |Type     |Options                      |
|--------------------|---------|-----------------------------|
|group_name          |string   |null: false                  |
|encrypted_password  |string   |null: false                  |
|note                |string   |                             |
 

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_one :calendars
- has_many :comments




## user_groupsテーブル

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
|user          |references |null: false, foreign_key: true  | 
|group         |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :group




## calendarsテーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
|title          |string      |null: false                     |
|datetime       |start_time  |null: false                     |
|datetime       |finish_time |null: false                     |
|note           |string      |                                |
|user           |references  |null: false, foreign_key: true  |
|group          |references  |null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :group
- has_many :comment




## commentsテーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
|content        |string      |                                |
|user           |references  |null: false, foreign_key: true  |
|group          |references  |null: false, foreign_key: true  |
|calendar       |references  |null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :group
- belongs_to :calendar


