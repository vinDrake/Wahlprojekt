require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  def test_the_truth
    assert true
  end

  def test_create_group
    group = Group.new( name: "Bla bla bla" )
    assert group.save
  end

  def test_create_group_with_too_short_name
    group = Group.new( name: "G" )
    assert_not group.save
  end

  def test_create_group_with_too_long_name
    string = "abcdefghijklmnopqrstuvwxyz"
    string = string*10
    group = Group.new( name: string )
    assert_not group.save
  end

  def test_create_group_without_name
    group = Group.new(  )
    assert_not group.save
  end

  def test_create_group_clone
    group = Group.new( name: "Bla bla bla" )
    group.save
    group_clone = Group.new( name: "Bla bla bla" )
    assert_not group_clone.save
  end


end
