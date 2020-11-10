require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def setup
    @night_writer = NightWriter.new(ARGV[0], ARGV[1])
  end
  def test_it_exists

    assert_instance_of NightWriter, @night_writer
  end

  def test_group_of_40_to_braille

    assert_equal 69, @night_writer.group_of_40_to_braille(ARGV[0], ARGV[1])
  end

  def test_message

    expected = "Created 'braille.txt' containing 12 characters"

    assert_equal expected, @night_writer.message(ARGV[0], ARGV[1])
  end

  def test_format_file_text

    assert_equal "pumpkin pie", @night_writer.format_file_text(ARGV[0])
  end

  def test_count_txt_file_characters

    assert_equal 12, @night_writer.count_txt_file_characters(ARGV[0])
  end


end
