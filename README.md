# テーブル設計

## users テーブル

| column     | Type   | option   | 
| :--------: | :----: | :------: | 
| email      | string | null: false| 
| password   | string | null: false| 
| name       | string | null: false| 
| profile    | text   | null: false| 
| occupation | text   | null: false| 
| position   | text   | null: false|

### association

- has_many :prototypes
- has_many :comments

## commentsテーブル

| column    | Type       | option      | 
| :-------: | :--------: | :---------: | 
| text      | text       | null: false | 
| user      | references |             | 
| prototype | references |             | 

### association

- belongs_to :users
- belongs_to :prototypes

## prototypesテーブル

| column     | Type       | option      | 
| :--------: | :--------: | :---------: | 
| title      | string     | null: false | 
| catch_copy | text       | null: false | 
| concept    | text       | null: false | 
| user       | references |             | 

### association

- belongs_to :users
- has_many :comments