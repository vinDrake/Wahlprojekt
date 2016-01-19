# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Die ersten Einträge:
Answer.create("correct"=>true, "answer_body"=>"Bruce Wayne", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"Peter Parker", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"Tony Stark", "question_id"=>1)

Answer.create("correct"=>true, "answer_body"=>"Tony Stark", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Bruce Wayne", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Peter Parker", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>2)

Answer.create("correct"=>true, "answer_body"=>"Peter Parker", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Bruce Wayne", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Tony Stark", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Alfred der Butler", "question_id"=>3)


Question.create("problem"=>"Wer ist Batman?")
Question.create("problem"=>"Wer ist Iron Man?")
Question.create("problem"=>"Wer ist Spiderman?")

Tag.create("name"=>"Das erste Tag")
Tag.create("name"=>"Filme")
Tag.create("name"=>"Comics")

Tie.create("question_id"=>1, "tag_id"=>1)
Tie.create("question_id"=>2, "tag_id"=>2)
Tie.create("question_id"=>2, "tag_id"=>3)
Tie.create("question_id"=>3, "tag_id"=>3)



# Um die Daten aus der Datenbank einzufügen siehe: lib/tasks/export.rake
