require './lib/translator.rb'

class NightWriter
  def initialize(arg1, arg2)
    @arg1 = arg1
    @arg2 = arg2
    convert_to_braille(@arg1)
    puts "Created '#{arg2}' containing #{count_txt_file_characters(arg1)} characters"
  end

  def count_txt_file_characters(arg1)
    lines = File.readlines(arg1)
    text = lines.join
    total_characters = text.length
    total_characters
  end

  def convert_to_braille(arg1)
    lines = File.readlines(arg1).join.gsub("\n", "")
    split_characters = lines.split("")
    new_line_1 = ""
    new_line_2 = ""
    new_line_3 = ""
    require "pry"; binding.pry
    split_characters.each do |character|
      new_line_1 + Translator.fetch(character).slice(0..1)
    end
    new_line_1 + "\n"
    split_characters.each do |character|
      new_line_2 + Translator.fetch(character).slice(2..3)
    end
    new_line_2 + "\n"
    split_characters.each do |character|
      new_line_3 + Translator.fetch(character).slice(4..5)
    end
    braille_output = new_line_1 + new_line_2 + new_line_3
    File.write('braille.txt', braille_output)
  end
end

  i_am_the_night = NightWriter.new(ARGV[0], ARGV[1])
