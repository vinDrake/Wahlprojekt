require 'test_helper'

class SelectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_the_truth
    assert true
  end

  def test_create_selection
    selection = Selection.new( tag: Tag.all.first , feeder: Feeder.all.first )
    assert selection.save
  end

  def test_create_selection_without_tag_and_feeder
    selection = Selection.new(  )
    assert_not selection.save
  end

  def test_create_selection_without_tag
    selection = Selection.new( feeder: Feeder.all.first )
    assert_not selection.save
  end

  def test_create_selection_without_feeder
    selection = Selection.new( tag: Tag.all.first )
    assert_not selection.save
  end

  def test_create_selection_clone
    tag = Tag.all.first
    feeder = Feeder.all.first
    selection = Selection.new( tag: tag , feeder: feeder )
    selection.save
    selectionClone = Selection.new( tag: tag , feeder: feeder )
    assert_not selectionClone.save
  end

end
