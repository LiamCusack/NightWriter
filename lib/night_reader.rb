require './lib/translator.rb'

class NightReader
  def initialize(arg1, arg2)
    @arg1 = arg1
    @arg2 = arg2
    @single_line_braille = ""
    @rows = []
    @three_rows = []
  end



i_read_the_night = NightReader.new(ARGV[0], ARGV[1])
#check if the index of each of the 3 strings is the same, if it is, add them together, then translate that through the hash.
