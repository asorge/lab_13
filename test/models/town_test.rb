require 'test_helper'

class TownTest < ActiveSupport::TestCase
  should have_many(:attractions).dependent(:destroy)

  context "Within context" do
    setup do
      create_towns
    end
    teardown do
      destroy_towns
    end

    should "show that alphabetical scope orders towns correctly" do
      assert_equal ["Pittsburgh", "St. Louis"], Town.alphabetical.map(&:name)
    end

    should "have a method to identify geocoordinates" do
      assert_in_delta(40.4406248, @pgh.latitude, 0.0005)
      assert_in_delta(-79.995886, @pgh.longitude, 0.0005)
    end
    
    should "fail to identify geocoordinates for a Klingon city" do
      bad_town = FactoryGirl.build(:town, name: "Quin'lat", state: "Qo'noS")
      deny bad_town.valid?, "#{bad_town.to_yaml}"
    end
  end
end
