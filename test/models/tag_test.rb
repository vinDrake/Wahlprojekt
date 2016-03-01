require 'test_helper'

class TagTest < ActiveSupport::TestCase

  def test_the_truth
    assert true
  end

  def test_create_tag
    tag = Tag.new( name: "Bla bla bla" )
    assert tag.save
  end

  def test_create_tag_with_too_short_name
    tag = Tag.new( name: "" )
    assert_not tag.save
  end

  def test_create_tag_with_too_long_name
    string = "abcdefghijklmnopqrstuvwxyz"
    string = string*10
    tag = Tag.new( name: string )
    assert_not tag.save
  end

  def test_create_tag_without_name
    tag = Tag.new(  )
    assert_not tag.save
  end

  def test_create_tag_clone
    tag = Tag.new( name: "Bla bla bla" )
    tag.save
    tag_clone = Tag.new( name: "Bla bla bla" )
    assert_not tag_clone.save
  end

end
