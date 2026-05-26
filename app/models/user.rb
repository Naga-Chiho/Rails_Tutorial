class User < ApplicationRecord
  belongs_to :department
  has_many :users_skills
  has_many :skills, through: :users_skills

  validates :name, presence: { message: "名前は必須です" }
  validates :name, length: { in: 2..50 ,message: "文字数が不適切です"}

  validates :furigana, presence: { message: "フリガナは必須です" }
  validates :furigana, format: { with: /\A[ァ-ヴー]+\z/,message: "カタカナのみ使用できます" }

  validates :gender, presence: { message: "性別は必須です" }

  validates :phone, presence: { message: "電話番号は必須です" }
  validates :phone, presence: true, format: { with: /\A0\d{2,4}-\d{1,4}-\d{1,4}\z/, message: "ハイフンありの電話番号でお願いします" }

  validates :mobile_phone, format: { with: /\A(070|080|090)-\d{4}-\d{4}\z/, message: "ハイフンありの携帯番号でお願いします" }

  validates :email, presence: { message: "メールは必須です" }
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }

  validates :postal_code, presence: { message: "郵便番号は必須です" }
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "ハイフンありでお願いします" }

  validates :address1, presence: { message: "都道府県は必須です" }
  validates :address2, presence: { message: "市区町村は必須です" }
  validates :address3, presence: { message: "町名・丁目は必須です" }
  validates :address4, presence: { message: "番地は必須です" }

  validates :birthday, presence: { message: "誕生日は必須です" }
  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, "未来の日付は選択できません") if value > Date.today
  end


  enum :address1, {
    北海道: "北海道",
    青森県: "青森県",
    岩手県: "岩手県",
    宮城県: "宮城県",
    秋田県: "秋田県",
    山形県: "山形県",
    福島県: "福島県",
    茨城県: "茨城県",
    栃木県: "栃木県",
    群馬県: "群馬県",
    埼玉県: "埼玉県",
    千葉県: "千葉県",
    東京都: "東京都",
    神奈川県: "神奈川県",
    新潟県: "新潟県",
    富山県: "富山県",
    石川県: "石川県",
    福井県: "福井県",
    山梨県: "山梨県",
    長野県: "長野県",
    岐阜県: "岐阜県",
    静岡県: "静岡県",
    愛知県: "愛知県",
    三重県: "三重県",
    滋賀県: "滋賀県",
    京都府: "京都府",
    大阪府: "大阪府",
    兵庫県: "兵庫県",
    奈良県: "奈良県",
    和歌山県: "和歌山県",
    鳥取県: "鳥取県",
    島根県: "島根県",
    岡山県: "岡山県",
    広島県: "広島県",
    山口県: "山口県",
    徳島県: "徳島県",
    香川県: "香川県",
    愛媛県: "愛媛県",
    高知県: "高知県",
    福岡県: "福岡県",
    佐賀県: "佐賀県",
    長崎県: "長崎県",
    熊本県: "熊本県",
    大分県: "大分県",
    宮崎県: "宮崎県",
    鹿児島県: "鹿児島県",
    沖縄県: "沖縄県"
  }, validate: true

end