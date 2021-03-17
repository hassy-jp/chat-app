# README

# テーブル設計

## user テーブル

| Column   | Type   | options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column   | Type   | options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## user_rooms テーブル

| Column   | Type       | options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belong_to :room
- belong_to :user

## messages テーブル

| Column   | Type       | options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belong_to :room
- belong_to :user




class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end