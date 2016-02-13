require 'test_helper'

class MessageTest < ActiveSupport::TestCase


  def test_the_truth
    assert true
  end

  def test_create_message
    message = Message.new( sender: User.all.first , receiver: User.all.first , subject: "Bla bla bla" , content: "Bla bla bla" )
    assert message.save
  end

  def test_create_message_without_sender
    message = Message.new( receiver: User.all.first , subject: "Bla bla bla" , content: "Bla bla bla" )
    assert_not message.save
  end

  def test_create_message_without_receiver
    message = Message.new( sender: User.all.first , subject: "Bla bla bla" , content: "Bla bla bla" )
    assert_not message.save
  end

  def test_create_message_without_subject
    message = Message.new( sender: User.all.first , receiver: User.all.first, content: "Bla bla bla" )
    assert_not message.save
  end

  def test_create_message_with_empty_subject
    message = Message.new( sender: User.all.first , receiver: User.all.first , subject: "" , content: "Bla bla bla" )
    assert message.save
  end

  def test_create_message_with_empty_content
    message = Message.new( sender: User.all.first , receiver: User.all.first , subject: "Bla bla bla" , content: "" )
    assert message.save
  end


  def test_create_message
    message = Message.new( sender: User.all.first , receiver: User.all.first , subject: "Bla bla bla" , content: "Bla bla bla" )
    assert message.save
  end


end
