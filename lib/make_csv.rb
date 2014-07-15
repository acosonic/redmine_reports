class MakeCsv
  require 'tempfile'
  require 'csv'

  def self.create_from_hash(header, data_hashs, footer)
    csv_data = CSV.generate(headers: header, write_headers: true, force_quotes: true) do |csv|
      data_hashs.each do |data_hash|
        value_arr = []
        data_hash.each do |key, value|
          value_arr << value
        end
        csv << value_arr
      end
    end
    csv_data.encode(Encoding::SJIS)
  end

  def self.create_from_arr(header, datas, footer)
    csv_data = CSV.generate(headers: header, write_headers: true, force_quotes: true) do |csv|
      datas.each do |data|
        value_arr = []
        data.each do |value|
          value_arr << value
        end
        csv << value_arr
      end
    end
    csv_data.encode(Encoding::SJIS)
  end
end
