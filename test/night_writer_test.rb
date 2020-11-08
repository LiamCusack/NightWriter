require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_it_exists
    night_writer = NightWriter.new(ARGV[0], ARGV[1])

    assert_instance_of NightWriter, night_writer
  end
end
