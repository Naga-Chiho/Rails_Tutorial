class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.belongs_to :department, null: false, foreign_key: true
      t.string :name, null: false
      t.string :furigana, null: false
      t.string :gender, null: false
      t.string :phone, null: false
      t.string :mobile_phone
      t.string :email, null: false
      t.string :postal_code, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :address3, null: false
      t.string :address4, null: false
      t.string :address5
      t.date :birthday
      t.timestamps
    end
  end
end
