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

end
