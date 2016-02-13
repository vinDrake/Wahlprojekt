require 'test_helper'

class AnswerTest < ActiveSupport::TestCase


  def test_the_truth
    assert true
  end

  def test_create_true_answer
    answer = Answer.new( question: Question.all.first , correct: true , answer_body: "Bla bla bla" )
    assert answer.save
  end

  def test_create_false_answer
    answer = Answer.new( question: Question.all.first , correct: false , answer_body: "Bla bla bla" )
    assert answer.save
  end

  def test_create_answer_without_question
    answer = Answer.new( correct: true , answer_body: "Bla bla bla" )
    assert_not answer.save
  end

  def test_create_answer_without_correctness
    answer = Answer.new( question: Question.all.first , answer_body: "Bla bla bla" )
    assert_not answer.save
  end

  def test_create_answer_without_answer_body
    answer = Answer.new( question: Question.all.first , correct: true )
    assert_not answer.save
  end

  def test_create_answer_with_too_short_answer_body
    answer = Answer.new( question: Question.all.first , correct: true , answer_body: "!" )
    assert_not answer.save
  end

  def test_create_answer_with_too_long_answer_body
    string = "abcdefghijklmnopqrstuvwxyz"
    string = string*10
    answer = Answer.new( question: Question.all.first , correct: true , answer_body: string )
    assert_not answer.save
  end





end
