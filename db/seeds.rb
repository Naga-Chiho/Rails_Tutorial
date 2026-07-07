require 'csv'

CSV.foreach('/workspace/db/personal_information.csv', headers: true) do |row|
  User.create(
    name: row['namae'],
    furigana: row['rubi'],
    gender: row['seibetu'],
    phone: row['denwa'],
    mobile_phone: row['keitai'],
    email: row['mairu'],
    postal_code: row['yuubinbango'],
    address1: row['jusho1'],
    address2: row['jusho2'],
    address3: row['jusho3'],
    address4: row['jusho4'],
    address5: row['jusho5'],
    birthday: row['tanjobi']
  )
end
