require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true, "True is true"
  # end

  # is equal to

  # def test_the_truth
  # assert true, "True is true"
  # end

  test "should not save user without name" do
    user = User.new
    assert_not user.save, "Saved the user without a name"
  end
end
