# Dieser Controller berechnet die Statistik eines Benutzers.

class StatsController < ApplicationController

  # TODO Dokumentieren
  # TODO Ordentlich implementieren oder ganz raus nehmen

  # Diese Methode berechnet den neuen Punktestand eines Benutzers sowie das Verhaeltnis zwischen richtig und falsch beantworteten Fragen.
  
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
