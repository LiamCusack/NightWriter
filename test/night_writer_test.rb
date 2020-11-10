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

  def test_attributes

    assert_equal ARGV[0], @night_writer.arg1
    assert_equal ARGV[1], @night_writer.arg2
  end

  def test_message

    expected = "Created 'braille.txt' containing 12 characters"

    assert_equal expected, @night_writer.message
  end

  def test_count_txt_file_characters

    assert_equal 12, @night_writer.count_txt_file_characters(ARGV[0])
  end


end
