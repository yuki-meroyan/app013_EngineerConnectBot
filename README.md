# README

## App URL
  [EngineerConnectBot](http://18.177.117.213/)

## Language
+ HTML(Haml)
+ CSS(Sass)
+ JavaScript(jQuery)
+ Ruby

## Database
+ MySQL

## FrameWork
+ Ruby on Rails

## Platform
+ AWS

## Detail
<details><summary><strong>Engineer Connect Botの概要</strong></summary>
  本アプリは個人間のメッセージのやりとりやグループ内でのリアルタイムチャットアプリとなっています
  <ol>
    <li><span>ユーザーの登録機能</span></li>
      <p>ユーザーの検索機能も備わっている</p>
    <li><span>グループ機能</span></li>
      <p>各グループごとに管理できる（他のユーザーを追加しないで自分専用のグループも複数作成可能）</p>
    <li><span>フォロー機能</span></li>
      <p>フォロー状況によって利用できるコンテンツが変わります</p>
    <li><span>チェット機能</span></li>
      <p>グループの人同士で非同期通信によるチャットが行えるコンテンツ</p>
    <li><span>メッセージ機能</span></li>
      <p>個別に送りたいメッセージをアプリ内メールボックスでやりとりを行えます
      ※実際のメールアドレスを使用したメールのやりとりではありません</p>
    <li><span>掲示板機能</span></li>
      <p>自分のレベル毎にカテゴライズしているので、レベルに合った掲示板に相談など投稿することができる</p>
  </ul>
</details>

## Table
### users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|string|
|mail|string|null: false, unique: true|
|password|string|null: false|
#### Association
- has_many   :groups, through: group_users
- has_many   :group_users
- belongs_to :expense

### user_details
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|address|string|default: 日本|
|level|string|default: 初級者|
|language|string|
|detail|text|
|user_id|references|null: false, foreign_key: true|

#### Association


### groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|master|integer|null: false|
|master_name|string|null: false|
|detail|text|

#### Association
- has_many :group_users, dependent: :destroy
- has_many :users, through: :group_users
- has_many :group_messages

### group_users
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user


### group_messages
|Column|Type|Options|
|------|----|-------|
|detail|text|null: false|
|image|string|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user

#### Other
- validates :text, presence: true, unless: :image?
- mount_uploader :image, GroupMessageImageUploader

### Beginners
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|category|string|null: false|
|language|string|null: false|
|detail|text|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many   :beginner_comments, dependent: :destroy

### Beginner_comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|beginner_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :beginner


### Intermediates
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|category|string|null: false|
|language|string|null: false|
|detail|text|null: false|
|entry_period|date|null: false|
|work_period|date|null: false|
|recruit_member|integer|null: false, default: 1|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many   :intermediates_comments, dependent: :destroy

### Intermediate_comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|intermediate_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :intermediate

### Seniors
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|category|string|null: false|
|language|string|null: false|
|detail|text|null: false|
|price|string|null: false|
|entry_period|date|null: false|
|work_period|date|null: false|
|assing_user|integer|
|assing|boolean|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many   :senior_comments, dependent: :destroy

### Senior_comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|senior_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :senior

### Private_messages
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|assing|boolean|default: 0|
|user_id|integer||null: false|
|send_user_id|integer|null: false|
|user_delete_flg|integer|default: 0|
|send_user_delete_flg|integer|default: 0|

#### Association
- belongs_to :user      , class_name: "User"
- belongs_to :send_user , class_name: "User"

#### Other
- validates :user_id     , presence: true
- validates :send_user_id, presence: true
- validates :text        , presence: true

### Relationships
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|
|followed_id|integer|

#### Other
[:follower_id, :followed_id], unique: true

### Follows
|Column|Type|Options|
|------|----|-------|
|followable|references|null: false, polymorphic: true|
|follower|references|null: false, polymorphic: true|

#### Association
- belongs_to :followable, polymorphic: true
- belongs_to :follower,   polymorphic: true

### Prefectures
|Column|Type|Options|
|------|----|-------|
|name|string|

