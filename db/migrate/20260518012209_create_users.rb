class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :furigana
      t.string :gender
      t.string :phone
      t.string :mobile_phone
      t.string :email
      t.string :postal_code
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5
      t.date :birthday

      t.timestamps
    end
  end
end
