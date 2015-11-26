class AddAnswerToRepleys < ActiveRecord::Migration
  def change
    add_reference :repleys, :answer, index: true, foreign_key: true
  end
end
