# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Die ersten Einträge:

# Answer.create("correct"=>true, "answer_body"=>"Bruce Wayne", "question_id"=>1)
# Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>1)
# Answer.create("correct"=>false, "answer_body"=>"Peter Parker", "question_id"=>1)
# Answer.create("correct"=>false, "answer_body"=>"Tony Stark", "question_id"=>1)
#
# Answer.create("correct"=>true, "answer_body"=>"Tony Stark", "question_id"=>2)
# Answer.create("correct"=>false, "answer_body"=>"Bruce Wayne", "question_id"=>2)
# Answer.create("correct"=>false, "answer_body"=>"Peter Parker", "question_id"=>2)
# Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>2)
#
# Answer.create("correct"=>true, "answer_body"=>"Peter Parker", "question_id"=>3)
# Answer.create("correct"=>false, "answer_body"=>"Bruce Wayne", "question_id"=>3)
# Answer.create("correct"=>false, "answer_body"=>"Tony Stark", "question_id"=>3)
# Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>3)


# Question.create("problem"=>"Wer ist Batman?")
# Question.create("problem"=>"Wer ist Iron Man?")
# Question.create("problem"=>"Wer ist Spiderman?")

# Tag.create("name"=>"Das erste Tag")
# Tag.create("name"=>"Filme")
# Tag.create("name"=>"Comics")
#
# Tie.create("question_id"=>1, "tag_id"=>1)
# Tie.create("question_id"=>2, "tag_id"=>2)
# Tie.create("question_id"=>2, "tag_id"=>3)
# Tie.create("question_id"=>3, "tag_id"=>3)

# Ein bisschen besser

question_list = [

  [  "Wer ist Batman?" , "Bruce Wayne" , "Alfred der Butler" , "Peter Parker" , "Tony Stark" ],
  [  "Wer ist Iron Man?" , "Tony Stark" , "Bruce Wayne" , "Peter Parker" , "Alfred der Butler" ],
  [  "Wer ist Spiderman?" , "Peter Parker" , "Bruce Wayne" , "Tony Stark" , "Alfred der Butler" ]

]

question_list.each do |question|
  q = Question.create( problem: question[0] )
  Answer.create( correct: true, answer_body: question[1], question: q )
  Answer.create( correct: false, answer_body: question[2], question: q )
  Answer.create( correct: false, answer_body: question[3], question: q )
  Answer.create( correct: false, answer_body: question[4], question: q )
end

tag_list = [

  [ "Filme" , [ 1 , 2 , 3 ] ],
  [ "Comics" , [ 1 , 2 , 3 ] ]

]

tag_list.each do |tag|
  t = Tag.create( name: tag[0])
  tag[1].each do |question|
    Tie.create( tag: t , question_id: question )
  end
end

challenge_list = [

  [ "Dead Challenge" , false , 0 , DateTime.now.next_year , false , 0 ],
  [ "60 Minute Challenge" , false , 3600 , DateTime.now.next_year , false , 0 ],
  [ "'3 Strikes and your out' Challenge" , false , 0 , DateTime.now.next_year , false , 3 ],
  [ "Ordered Challenge" , true , 0 , DateTime.now.next_year , true , 0 ],
  [ "Past Challenge" , true , 0 , DateTime.now.last_month , false , 0 ],
  [ "Tomorrow Challenge" , true , 0 , DateTime.now.tomorrow , false , 0 ],
  [ "Alive Challenge" , true , 0 , DateTime.now.next_quarter , false , 0 ],
  [ "Next Week Challenge" , true , 0 , DateTime.now.next_week , false , 0 ],
  [ "Next Month Challenge" , true , 0 , DateTime.now.next_month , false , 0 ],
  [ "Next Quarter Challenge" , true , 0 , DateTime.now.next_quarter , false , 0 ],
  [ "Next Year Challenge" , true , 0 , DateTime.now.next_year , false , 0 ]

]
challenge_list.each do |challenge|
  Challenge.create( name: challenge[0] , alive: challenge[1] , max_challenge_time: challenge[2] , latest_end: challenge[3] , strict_order: challenge[4] , strikes: challenge[5]  )
end

# Um die Daten aus der Datenbank einzufügen siehe: lib/tasks/export.rake
