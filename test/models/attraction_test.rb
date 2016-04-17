require 'test_helper'

class AttractionTest < ActiveSupport::TestCase
  should belong_to(:town)

  context "Within context" do
    setup do
      create_towns
      create_attractions
    end
    teardown do
      destroy_towns
      destroy_attractions
    end

    should "show that alphabetical scope orders attractions correctly" do
      assert_equal ["Carnegie Mellon University", "PNC Park"], Attraction.alphabetical.map(&:name)
    end

    should "have a method to identify geocoordinates" do
      assert_in_delta(40.443946, @cmu.latitude, 0.0005)
      assert_in_delta(-79.943457, @cmu.longitude, 0.0005)
    end
  end
end
