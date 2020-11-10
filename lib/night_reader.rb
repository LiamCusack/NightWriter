require './lib/translator.rb'

class NightReader
  def initialize(arg1, arg2)
    translate_to_english(arg1, arg2)
    message(arg2)
  end

  def message(arg2)
    puts "Created '#{arg2}' containing #{count_txt_file_characters(arg2)} characters"
  end

  def sort_by_row(arg1)
    File.read(arg1).split("\n")
  end

  def line_up_rows(arg1)
    three_rows = ["", "", ""]

    sort_by_row(arg1).each do |row|
      if sort_by_row(arg1).index(row) % 3 == 0
        three_rows[0] += row
      elsif sort_by_row(arg1).index(row) % 3 == 1
        three_rows[1] += row
      else sort_by_row(arg1).index(row) % 3 == 2
        three_rows[2] += row
      end
    end
    three_rows
  end

  def sort_rows_by_character(arg1)
    scanned_rows = []

    line_up_rows(arg1).each do |row|
      scanned_rows << row.scan(/../)
    end
    scanned_rows
  end

  def sort_by_index(arg1)
    translation  = Hash.new
    key = 0

    sort_rows_by_character(arg1).each do |row|
      if row == sort_rows_by_character(arg1).first
        row.each do |pair|
          translation[key] = pair
          key += 1
        end
        key = 0
      else
        row.each do |pair|
          translation[key] += pair
          key += 1
        end
        key = 0
      end
    end
    translation
  end

  def translate_to_english(arg1, arg2)
    english_output = ""

    sort_by_index(arg1).each do |braille|
      english_output += TRANSLATOR.key(braille[1])
    end
    write_to_txt_file(arg2, english_output)
  end

  def write_to_txt_file(arg2, english_output)
    File.write(arg2, english_output.scan(/.{1,80}/).join("\n"))
  end

  def count_txt_file_characters(arg2)
    File.readlines(arg2).join.length
  end
end

i_read_the_night = NightReader.new(ARGV[0], ARGV[1])
