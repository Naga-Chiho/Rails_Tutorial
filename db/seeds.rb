require "csv"

csv_path =  "/workspace/db/personal_information.csv"

CSV.foreach(csv_path, headers: true) do |row|
  User.create!(row.to_hash)
end