require 'test_helper'

class ElementTest < ActiveSupport::TestCase

    def test_the_truth
      assert true
    end

    def test_create_element
      element = Element.new( challenge: Challenge.new( alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 ) , question: Question.all.first )
      assert element.save
    end

    def test_create_element_without_parameter
      element = Element.new(  )
      assert_not element.save
    end

    def test_create_element_without_question
      element = Element.new( challenge: Challenge.new( alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 ) )
      assert_not element.save
    end

    def test_create_element_without_challenge
      element = Element.new( question: Question.all.first )
      assert_not element.save
    end

    # Erlaubt?
    # def test_create_element_clone
    #   question = Question.all.first
    #   challenge = Challenge.new( alive: true , max_challenge_time: 1000 , latest_end: DateTime.now , strict_order: true , strikes: 3 )
    #   element = Element.new( question: question , challenge: challenge )
    #   element.save
    #   elementClone = Element.new( question: question , challenge: challenge )
    #   assert_not elementClone.save
    # end

end
