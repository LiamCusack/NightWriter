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

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.sort_by_row(ARGV[0])
  end

  def test_line_up_rows

    @nightreader.sort_by_row(ARGV[0])

    expected = ["000.00000..000..00.00.", "0.....0...0..0..0.0..0", "0.000.0.0...0...0....."]

    assert_equal expected, @nightreader.line_up_rows
  end

  def test_row_by_character

    @nightreader.sort_by_row(ARGV[0])
    @nightreader.line_up_rows

    expected = [["00", "0.", "00", "00", "0.", ".0", "00", "..", "00", ".0", "0."], ["0.", "..", "..", "0.", "..", "0.", ".0", "..", "0.", "0.", ".0"], ["0.",
 "00", "0.", "0.", "0.", "..", "0.", "..", "0.", "..", ".."]]

    assert_equal expected, @nightreader.row_by_character
  end
end
