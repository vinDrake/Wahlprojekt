require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase

  def test_the_truth
    assert true
  end

  # Name
  def test_create_challenge_without_name
    challenge = Challenge.new( alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  def test_create_challenge_with_too_short_name
    challenge = Challenge.new( name: "1" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  def test_create_challenge_with_too_long_name
    string = "abcdefghijklmnopqrstuvwxyz"
    string = string*10
    challenge = Challenge.new( name: string , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  # alive
  def test_create_challenge_alive_true
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_alive_false
    challenge = Challenge.new( name: "Bla" , alive: false , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_without_alive
    challenge = Challenge.new( name: "Bla" , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  # max_challenge_time
  def test_create_challenge_with_max_challenge_time_zero
    challenge = Challenge.new( name: "Bla" , max_challenge_time: 0 , alive: true , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_with_max_challenge_time_below_zero
    challenge = Challenge.new( name: "Bla" , max_challenge_time: -1000 , alive: true , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  def test_create_challenge_with_max_challenge_time_above_zero
    challenge = Challenge.new( name: "Bla" , max_challenge_time: 1000 , alive: true , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_without_max_challenge_time
    challenge = Challenge.new( name: "Bla" , alive: true , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  # latest_end
  def test_create_challenge_latest_end_past
    challenge = Challenge.new( name: "Bla" , alive: true , latest_end: DateTime.now.last_week , max_challenge_time: 1000 , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_latest_end_now
    challenge = Challenge.new( name: "Bla" , alive: true , latest_end: DateTime.now , max_challenge_time: 1000 , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_latest_end_future
    challenge = Challenge.new( name: "Bla" , alive: true , latest_end: DateTime.now.next_week , max_challenge_time: 1000 , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_without_latest_end
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , strict_order: true , strikes: 3 )
    assert_not challenge.save
  end

  # strict_order
  def test_create_challenge_without_strict_order
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strikes: 3 )
    assert_not challenge.save
  end

  def test_create_challenge_strict_order_true
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    assert challenge.save
  end

  def test_create_challenge_strict_order_false
    challenge = Challenge.new( name: "Bla" , alive: false , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: false , strikes: 3 )
    assert challenge.save
  end

  # strikes
  def test_create_challenge_with_strikes_below_zero
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: -3 )
    assert_not challenge.save
  end

  def test_create_challenge_with_zero_strikes
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 0 )
    assert challenge.save
  end

  def test_create_challenge_without_strikes
    challenge = Challenge.new( name: "Bla" , alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true )
    assert_not challenge.save
  end

  #
  def test_create_challenge_without_parameter
    challenge = Challenge.new( )
    assert_not challenge.save
  end

end
