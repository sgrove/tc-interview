require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test "0 length path" do
    assert_equal 0, Actor.find_by_name( "Actor 1" ).steps_to( Actor.find_by_name( "Actor 2" ) )
  end

  test "1 length path" do
    assert_equal 1, Actor.find_by_name( "Actor 1" ).steps_to( Actor.find_by_name( "Actor 3" ) )
  end

  test "2 length path" do
    assert_equal 2, Actor.find_by_name( "Actor 1" ).steps_to( Actor.find_by_name( "Actor 4" ) )
  end

  test "dead end path" do
    assert_equal false, Actor.find_by_name( "Actor 1" ).steps_to( Actor.find_by_name( "Actor 5" ) )
  end
end
