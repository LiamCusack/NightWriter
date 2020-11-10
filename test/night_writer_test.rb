require_relative './test_helper'
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
    night_writer = mock
    night_writer.stubs(:message).returns("Created 'braille.txt' containing 11 characters")
    expected = "Created 'braille.txt' containing 11 characters"

    assert_equal expected, night_writer.message
  end

  def test_format_file_text

    assert_equal "pumpkin pie", @night_writer.format_file_text(ARGV[0])
  end

  def test_count_txt_file_characters

    assert_equal File.readlines(ARGV[0]).join.length, @night_writer.count_txt_file_characters(ARGV[0])
  end

  def test_group_by_40

    expected = [["p", "u", "m", "p", "k", "i", "n", " ", "p", "i", "e"]]

    assert_equal expected, @night_writer.group_by_40(ARGV[0])
  end

  def test_write_to_txt_file

    actual_arguement_2 = "000.00000..000..00.00.
    0.....0...0..0..0.0..0
    0.000.0.0...0...0....."

    assert_equal 76, @night_writer.write_to_txt_file(ARGV[1], actual_arguement_2)
  end

  def test_convert_to_braille

    expected = "000.00000..000
0.....0...0..0
0.000.0.0...0.
"

    assert_equal expected, @night_writer.convert_to_braille(["p","u","m","p","k","i","n"])
  end
end
