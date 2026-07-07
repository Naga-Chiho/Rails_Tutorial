require 'csv'

namespace :import do
  desc 'ユーザーの取得'

  task :users, [:file_path] => :environment do |_t, args|
    csv_path = args[:file_path]

    unless File.exist?(csv_path)
      puts "ファイルが見つかりません (#{csv_path})"
      exit
    end

    departments = Department.all.index_by(&:name)
    error_records = []

    CSV.foreach(csv_path, headers: true) do |row|
      department = departments[row['busho']]

      begin
        User.create!(
          name: row['namae'],
          furigana: row['rubi'],
          gender: row['seibetu'],
          department: department,
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
      rescue ActiveRecord::RecordInvalid => e
        error_records << { name: row['namae'], error: e.message }
      end
    end

    puts 'インポート処理が完了しました！'
    error_records.each do |err|
      puts "名前: #{err[:name]}, エラー内容: #{err[:error]}"
    end
  end
end
