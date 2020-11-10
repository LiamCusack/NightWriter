require_relative './test_helper'
require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"
require "mocha/minitest"

class NightReaderTest < Minitest::Test
  def setup
    @nightreader = NightReader.new(ARGV[0], ARGV[1])
  end

  def test_it_exists

    assert_instance_of NightReader, @nightreader
  end

  def test_sort_by_row

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.sort_by_row(ARGV[0])
  end

  def test_message
    nightreader = mock("NightReader.new")
    nightreader.stubs(:message).returns("Created 'original_message.txt' containing 11 characters")
    expected = "Created 'original_message.txt' containing 11 characters"

    assert_equal expected, nightreader.message
  end

  def test_line_up_rows

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.line_up_rows(ARGV[0])
  end

  def test_sort_row_by_character

    expected = [["00", "0.", "00", "00", "0.", ".0", "00", "..", "00", ".0", "0."], ["0.", "..", "..", "0.", "..", "0.", ".0", "..", "0.", "0.", ".0"], ["0.",
 "00", "0.", "0.", "0.", "..", "0.", "..", "0.", "..", ".."]]

    assert_equal expected, @nightreader.sort_rows_by_character(ARGV[0])
  end

  def test_sort_by_index

    expected = {0=>"000.0.", 1=>"0...00", 2=>"00..0.", 3=>"000.0.", 4=>"0...0.", 5=>".00...", 6=>"00.00.", 7=>"......", 8=>"000.0.", 9=>".00...", 10=>"0..0.."}

    assert_equal expected, @nightreader.sort_by_index(ARGV[0])
  end

  def test_translate_to_english

    assert_equal 11, @nightreader.translate_to_english(ARGV[0], ARGV[1])
  end

  def test_count_txt_file_characters

    assert_equal 11, @nightreader.count_txt_file_characters(ARGV[1])
  end

  def test_write_to_txt_file

    actual_arg_2 = "pumpkin pie"

    assert_equal 11, @nightreader.write_to_txt_file(ARGV[1], actual_arg_2)
  end
end
