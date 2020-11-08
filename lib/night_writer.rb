require './lib/translator.rb'

class NightWriter
  def initialize(arg1, arg2)
    @arg1 = arg1
    @arg2 = arg2
    @braille_output = ""
    @lines = File.readlines(arg1).join.gsub("\n", "")
    braille_by_40_lines
    puts "Created '#{arg2}' containing #{count_txt_file_characters(arg1)} characters"
  end

  def count_txt_file_characters(arg1)
    lines = File.readlines(arg1)
    total_characters = lines.join.length
  end

  def group_by_40
    split_characters = @lines.split("")
    character_groups = split_characters.each_slice(40)
    character_groups
  end

  def braille_by_40_lines
    self.group_by_40.each do |group|
      convert_to_braille(group)
    end
    File.write('braille.txt', @braille_output)
  end

  def convert_to_braille(group)
    new_line_1 = ""
    new_line_2 = ""
    new_line_3 = ""
    group.each do |character|
      new_line_1 += TRANSLATOR.fetch(character).slice(0..1)
    end
    new_line_1 += "\n"
    group.each do |character|
      new_line_2 += TRANSLATOR.fetch(character).slice(2..3)
    end
    new_line_2 += "\n"
    group.each do |character|
      new_line_3 += TRANSLATOR.fetch(character).slice(4..5)
    end
    @braille_output += new_line_1 + new_line_2 + new_line_3 + "\n"
  end
end

  i_am_the_night = NightWriter.new(ARGV[0], ARGV[1])
