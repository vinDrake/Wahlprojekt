require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_the_truth
    assert true
  end

  def test_create_question
    question = Question.new( problem: "Bla bla bla" )
    assert question.save
  end

  def test_create_to_short_question
    question = Question.new( problem: "?" )
    assert_not question.save
  end

  def test_create_to_long_question
    string = "abcdefghijklmnopqrstuvwxyz"
    string = string*10
    question = Question.new( problem: string )
    assert_not question.save
  end

  def test_create_question_without_problem
    question = Question.new(  )
    assert_not question.save
  end

  def test_create_question_clone
    question = Question.new( problem: "Bla bla bla" )
    question.save
    question_clone = Question.new( problem: "Bla bla bla" )
    assert_not question_clone.save
  end


end
