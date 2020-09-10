require "./lib/museum"
require "minitest/autorun"
require "minitest/pride"

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_is_museum
    assert_instance_of Museum, @dmns
  end

end
