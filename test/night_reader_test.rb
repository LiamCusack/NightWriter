require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"

class NightReader < Minitest::Test
  def setup
    @nightreader = NightReader.new(ARGV[0], ARGV[1])
  end

  def test_it_exists

    assert_instance_of NightReader, @nightreader
  end
end
