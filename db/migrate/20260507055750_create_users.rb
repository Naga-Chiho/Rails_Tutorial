class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name         
      t.string :furigana      # rubi
      t.string :gender        # seibetu
      t.string :phone         # denwa
      t.string :mobile_phone  # keitai
      t.string :email         # mairu
      t.string :postal_code   # yuubinbango
      t.string :address1      # jusho1
      t.string :address2      # jusho2
      t.string :address3      # jusho3
      t.string :address4      # jusho4
      t.string :address5      # jusho5
      t.date   :birthday      # tanjobi 

      t.timestamps
    end
  end
end