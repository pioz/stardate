require 'test_helper'

class StardateTest < Minitest::Test
  def test_to_stardate
    Stardate.set_base_date_to_2323
    time = Time.parse('2364-12-26 03:05:54')
    assert_equal 41_986.0, time.to_stardate
  end

  def test_to_time
    Stardate.set_base_date_to_2323
    assert_equal Time.parse('2364-12-26 03:05:54'), 41_986.0.to_time
  end

  def test_to_stardate_base_date_2005
    Stardate.set_base_date_to_2005
    time = Time.parse('2364-12-26 03:05:54')
    assert_equal 417_986.0, time.to_stardate
  end

  def test_to_time_base_date_2005
    Stardate.set_base_date_to_2005
    assert_equal Time.parse('2364-12-26 03:05:54'), 417_986.0.to_time
  end

  def test_to_stardate_to_time
    time = Time.parse('2364-12-26 03:05:54')
    assert_equal time, time.to_stardate.to_time
  end

  def test_to_time_to_stardate
    s = 417_986.0
    assert_equal s, s.to_time.to_stardate
  end
end
