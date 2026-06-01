require 'csv'

namespace :import do
  desc "ユーザーの取得"
  
  task :users, [:file_path] => :environment do |t, args|
    csv_path = args[:file_path]
    departments = Department.all.index_by(&:name)

    CSV.foreach(csv_path, headers: true) do |row|
      department = departments[row["busho"]]

      User.create(
        name:         row["namae"],
        furigana:     row["rubi"],
        gender:       row["seibetu"],
        department:   department,
        phone:        row["denwa"],
        mobile_phone: row["keitai"],
        email:        row["mairu"],
        postal_code:  row["yuubinbango"],
        address1:     row["jusho1"],
        address2:     row["jusho2"],
        address3:     row["jusho3"],
        address4:     row["jusho4"],
        address5:     row["jusho5"],
        birthday:     row["tanjobi"]
      )
    end
  end
end