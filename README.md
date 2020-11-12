# アプリケーション名
 IWAI 

## 概要
親族や友人の結婚のお祝いに送るギフトを価格別に選べるサイト。

## 本番環境URL

### テストアカウントとID


## 制作背景
便利な商品やお洒落なインテリアなどを生み出すクリエーターたちが、
広告費をかけれず自分の商品をなかなか世の中に出せていない現状をIWAIを使って打破し、
購入者はありふれたお祝い商品ではない、目を引くようなアイテムが購入できる。
そんなマッチング性の高いアプリケーションを作成しました。

## DEMO
　TOP画面（静止画）
https://gyazo.com/2f8e6be53ad83f0b10ed35f10a098c46

　TOP画面の動画（gif）
https://gyazo.com/1c7dd2a0784164eca01fe26f1c4f9f2d

### 工夫したポイント
TOPページのビューを男女問わず受け入れてもらえるようなデザインにしました。
好き嫌いが出にくいイラストと中心に構成し、IllustratorやPhotoshopを使い、
全体の色使いも好き嫌いが出にくい白を基調としました。（お祝いとかけて紅白イメージ）

また今後実装予定のハッシュタグ検索により、自分が求めている商品の幅を狭めかつ新しいアイデア商品に
出会えるようなきっかけを作ります。

### 使用技術(開発環境)
rails6.0.0
ruby
html
css
github
java script
jQuery
Illustrator（画像加工）
Photoshop（画像加工）

## 課題や今後実装したい機能
ハッシュタグ機能
人気クリエーターランキング

## DB設計
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
usersテーブル
      t.string :nickname,           null: false #ニックネーム
      t.string :company #会社名
      t.string :first_name,         null: false #姓
      t.string :last_name,          null: false #名
      t.string :first_name_kana,    null: false #カナ姓
      t.string :last_name_kana,     null: false #カナ名
      t.date   :birthday,           null: false #生年月日
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
itemsテーブル
      t.string :product,            null: false #商品名
      t.text :product_copy,         null: false #商品説明
      t.integer :category_id,       null: false #カテゴリー
      t.integer :burden_id,         null: false #配送料の負担
      t.integer :area_id,           null: false #配送元地域
      t.integer :area_day_id,       null: false #配送までの日数
      t.integer :price,             null: false #価格
      t.string  :item_pas,          null: false #出品パスワード
      t.references :user,           null: false, foreign_key: true #user

　belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :area_day

  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :likes, dependent: :destroy
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
ordersテーブル
      t.references :user,           null: false, foreign_key: true #user
      t.references :item,           null: false, foreign_key: true #item

　belongs_to :item
  belongs_to :user
  has_one :buy
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
buysテーブル
      t.string  :postal_code,        null: false #郵便番号
      t.integer :area_id,            null: false #都道府県
      t.string  :city,               null: false #市区町村
      t.string  :address,            null: false #番地
      t.string  :building #建物名
      t.string  :tel,                null: false #電話番号
      t.references :order,           null: false, foreign_key: true

  belongs_to :order
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
likesテーブル
      t.integer :item_id
      t.integer :user_id

  belongs_to :item
  belongs_to :user
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿


