# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data= []
    lines = tsv.split("\n")
    header = lines[0].chomp("\n").split("\t")
    lines.delete_at(0)
    lines.each do  |line|
      data_hash = {}
      line.chomp("\n").split("\t").each.with_index do |value, i|
        data_hash[header[i]] = value
      end
      @data << data_hash
    end
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    arr_data = []
    @data.each.with_index do |data, i|
      if i == 0
        arr_data <<  @data[i].keys.join("\t")+"\n"
        arr_data << data.values.join("\t") + "\n"
      else
        arr_data << data.values.join("\t") + "\n"
      end
    end
    arr_data.join
  end

end
