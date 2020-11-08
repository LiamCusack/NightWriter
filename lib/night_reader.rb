require './lib/translator.rb'

class NightReader
  def initialize(arg1, arg2)
    @arg1 = arg1
    @arg2 = arg2
    @single_line_braille = ""
  end

  def sort_by_row(arg1)
    characters = []
    File.open(arg1, "r").each_line do |line|
      line.each_slice(2)
    end
  end

end

i_read_the_night = NightReader.new(ARGV[0], ARGV[1])
