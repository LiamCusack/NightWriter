require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"

class NightReaderTest < Minitest::Test
  def setup
    @nightreader = NightReader.new(ARGV[0], ARGV[1])
  end

  def test_it_exists

    assert_instance_of NightReader, @nightreader
  end

  def test_sort_by_row
    skip

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.sort_by_row(ARGV[0])
  end

  def test_line_up_rows
    skip

    @nightreader.sort_by_row(ARGV[0])

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.line_up_rows
  end

  def test_row_by_character
    skip

    @nightreader.sort_by_row(ARGV[0])
    @nightreader.line_up_rows

    expected = [["00", "0.", "00", "00", "0.", ".0", "00", "..", "00", ".0", "0."], ["0.", "..", "..", "0.", "..", "0.", ".0", "..", "0.", "0.", ".0"], ["0.",
 "00", "0.", "0.", "0.", "..", "0.", "..", "0.", "..", ".."]]

    assert_equal expected, @nightreader.row_by_character
  end

  def test_sort_by_index
    @nightreader.sort_by_row(ARGV[0])
    @nightreader.line_up_rows
    @nightreader.row_by_character

    expected = {0=>"000.0.", 1=>"0...00", 2=>"00..0.", 3=>"000.0.", 4=>"0...0.", 5=>".00...", 6=>"00.00.", 7=>"......", 8=>"000.0.", 9=>".00...", 10=>"0..0.."}

    assert_equal expected, @nightreader.sort_by_index
  end

  def test_translate_to_english
    skip

    @nightreader.sort_by_row(ARGV[0])
    @nightreader.line_up_rows
    @nightreader.row_by_character
    @nightreader.sort_by_index

    assert_equal "pumpkin pie", @nightreader.translate_to_english
  end

  def test_count_txt_file_characters

    assert_equal 11, @nightreader.count_txt_file_characters(ARGV[1])
  end
end
