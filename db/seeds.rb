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

question_list.each_with_index do |question , index|
  Question.create( id: index , problem: question[0] )
  Answer.create( correct: true, answer_body: question[1], question_id: index )
  Answer.create( correct: false, answer_body: question[2], question_id: index )
  Answer.create( correct: false, answer_body: question[3], question_id: index )
  Answer.create( correct: false, answer_body: question[4], question_id: index )
end

tag_list = [

  [ "Filme" , [ 1 , 2 , 3 ] ],
  [ "Comics" , [ 1 , 2 , 3 ] ]

]

tag_list.each_with_index do |tag , index|
  Tag.create( id: index , name: tag[0])
  tag[1].each do |question|
    Tie.create( tag_id: index , question_id: question )
  end
end

# Um die Daten aus der Datenbank einzufügen siehe: lib/tasks/export.rake
