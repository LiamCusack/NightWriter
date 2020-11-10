require './lib/translator.rb'

class NightReader
  def initialize(arg1, arg2)
    @arg1         = arg1
    @arg2         = arg2
    @rows         = []
    runner(arg1, arg2)
  end

  def runner(arg1, arg2)
    sort_by_row(arg1)
    translate_to_english
    message(arg2)
  end

  def message(arg2)
    puts "Created '#{arg2}' containing #{count_txt_file_characters(arg2)} characters"
  end

  def sort_by_row(arg1)
    @rows = File.read(arg1).split("\n")
  end

  def line_up_rows
    three_rows = []
    top = ""
    middle = ""
    bottom = ""

    @rows.each do |row|
      if @rows.index(row) % 3 == 0
        top += row
      elsif @rows.index(row) % 3 == 1
        middle += row
      else @rows.index(row) % 3 == 2
        bottom += row
      end
    end
    three_rows << top
    three_rows << middle
    three_rows << bottom
  end

  def row_by_character
    scanned_rows = []

    line_up_rows.each do |row|
      scanned_rows << row.scan(/../)
    end
    scanned_rows
  end

  def sort_by_index
    translation  = Hash.new
    key = 0

    row_by_character[0].each do |pair|
      translation[key] = pair
      key += 1
    end
    key = 0
    row_by_character[1].each do |pair|
      translation[key] += pair
      key += 1
    end
    key = 0
    row_by_character[2].each do |pair|
      translation[key] += pair
      key += 1
    end
    translation
  end

  def translate_to_english
    english_output = ""

    sort_by_index.each do |braille|
      english_output += TRANSLATOR.key(braille[1])
    end
    File.write(@arg2, english_output)
    english_output
  end

  def count_txt_file_characters(arg2)
    lines = File.readlines(arg2)
    total_characters = lines.join.length
  end
end

i_read_the_night = NightReader.new(ARGV[0], ARGV[1])
#check if the index of each of the 3 strings is the same, if it is, add them together, then translate that through the hash.
