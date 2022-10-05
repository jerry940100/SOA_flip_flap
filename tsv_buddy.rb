# frozen_string_literal: true

NEWLINE = "\n"
TAB = "\t"
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    # puts tsv
    tsv_array = tsv.chomp.split(NEWLINE)
    puts tsv_array.length
    # print(tsv_array)
    head = tsv_array[0].split(TAB)
    # tsv_array.each { |ele| print ele }
    # puts tsv_array
    # puts a
    @data = (1..tsv_array.length - 1).map do |i|
      body = tsv_array[i].split(TAB)
      parse_row(head, body)
    end
  end

  def parse_row(head, body)
    { head[0] => body[0],
      head[1] => body[1],
      head[2] => body[2],
      head[3] => body[3],
      head[4] => body[4],
      head[5] => body[5] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    row = @data[0].keys
    tsv = row.join(TAB) + NEWLINE
    @data.each do |ele|
      tsv += ele.values.join(TAB) + NEWLINE
    end
    tsv
  end
end

class Tester
  include TsvBuddy
end

t = Tester.new
t.take_tsv(File.read('data/survey.tsv'))
puts t.to_tsv
# print(t)
