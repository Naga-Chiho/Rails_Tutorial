require 'csv'

# 名前空間
namespace :import do

  # タスクの説明 desc => description（説明）
  desc "ユーザーの取得"

  # task_name => タスクの名前
  task users: :environment do
    # 実行したい処理を記述する場所
    CSV.foreach("/workspace/db/personal_infomation.csv", headers: true) do |row|
      department = Department.find_by(name: row["busho_name"])

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