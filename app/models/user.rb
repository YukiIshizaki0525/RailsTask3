class User < ApplicationRecord
  # クラスメソッド指定
  def self.import(path)
    list = []
    # header(CSVデータ内の1行目)をデータベースには登録しない指定
    CSV.foreach(path, headers: true) do |row|
      list << {
           name: row["name"],
            age: row["age"],
        address: row["address"]
    }
    end
      puts "インポート開始"
      User.create!(list)
      puts "インポートに成功しました。"
    rescue ActiveModel::UnknownAttributeError => invalid
      # 2~15行目がErrorが発生した場合に例外処理が起きる
      puts "インポートに失敗しました：#{invalid}"

  end
end
