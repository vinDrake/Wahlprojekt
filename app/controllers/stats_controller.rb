class StatsController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @challenges = @user.challenges
    @questions = @user.questions

    answer_count = @user.repleys.size
    correct_answer_count = 0
    @user.repleys.each do |r|
      if r.correct
        correct_answer_count += 1
      end
    end
    @hit_ratio = ( correct_answer_count.to_f  / answer_count.to_f ) *100
  end
end
