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
end
