require './lib/translator.rb'

class NightReader
  def initialize(arg1, arg2)
    @arg1 = arg1
    @arg2 = arg2
    @single_line_braille = ""
    @rows = []
    @three_rows = []
  end

  def sort_by_row(arg1)
    @rows = File.read(arg1).split("\n")
  end

  def line_up_rows
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
    @three_rows << top
    @three_rows << middle
    @three_rows << bottom
  end

  def row_by_character
    @three_rows.map do |row|
      row.scan(/../)
    end
  end
end

i_read_the_night = NightReader.new(ARGV[0], ARGV[1])
#check if the index of each of the 3 strings is the same, if it is, add them together, then translate that through the hash.
