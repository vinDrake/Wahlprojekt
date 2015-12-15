# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Um die Daten aus der Datenbank einzufügen siehe: lib/tasks/export.rake


Answer.create("correct"=>true, "answer_body"=>"2", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"3", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"1", "question_id"=>1)
Answer.create("correct"=>false, "answer_body"=>"4", "question_id"=>1)
Answer.create("correct"=>true, "answer_body"=>"Flash", "question_id"=>4)
Answer.create("correct"=>false, "answer_body"=>"Batman", "question_id"=>4)
Answer.create("correct"=>false, "answer_body"=>"Spiderman", "question_id"=>4)
Answer.create("correct"=>false, "answer_body"=>"Superman", "question_id"=>4)
Answer.create("correct"=>true, "answer_body"=>"Batman", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Superman", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Flash", "question_id"=>2)
Answer.create("correct"=>false, "answer_body"=>"Spiderman", "question_id"=>2)
Answer.create("correct"=>true, "answer_body"=>"Superman", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Spiderman", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Flash", "question_id"=>3)
Answer.create("correct"=>false, "answer_body"=>"Batman", "question_id"=>3)
Answer.create("correct"=>true, "answer_body"=>"Spiderman", "question_id"=>5)
Answer.create("correct"=>false, "answer_body"=>"Superman", "question_id"=>5)
Answer.create("correct"=>false, "answer_body"=>"Flash", "question_id"=>5)
Answer.create("correct"=>false, "answer_body"=>"Batman", "question_id"=>5)

Challenge.create("name"=>"Comicverfilmungen", "alive"=>true, "max_challenge_time"=>1, "latest_end"=>Wed, 16 Dec 2015 12:29:00 UTC +00:00, "strict_order"=>false, "strikes"=>1)

Element.create("challenge_id"=>1, "question_id"=>2)
Element.create("challenge_id"=>1, "question_id"=>3)
Element.create("challenge_id"=>1, "question_id"=>4)
Element.create("challenge_id"=>1, "question_id"=>5)
Element.create("challenge_id"=>2, "question_id"=>1)

Feed.create("priority"=>1, "feeder_id"=>1, "question_id"=>1)

Feeder.create("user_id"=>1)

Group.create("name"=>"Club der toten Dichter")
Group.create("name"=>"Avengers")

Membership.create("user_id"=>1, "group_id"=>1)

Question.create("problem"=>"Was ist 1 + 1?")
Question.create("problem"=>"Welche geheime Identität hat Bruce Wayne?")
Question.create("problem"=>"Welche geheime Identität hat Clark Kent?")
Question.create("problem"=>"Welche geheime Identität hat Berry Allen?")
Question.create("problem"=>"Welche geheime Identität hat Peter Parker?")

Repley.create("user_id"=>1, "question_id"=>1, "answer_id"=>2)

Tag.create("name"=>"-")
Tag.create("name"=>"Mathe")
Tag.create("name"=>"Filme")
Tag.create("name"=>"Comics")

Tie.create("question_id"=>2, "tag_id"=>3)
Tie.create("question_id"=>3, "tag_id"=>3)
Tie.create("question_id"=>4, "tag_id"=>3)
Tie.create("question_id"=>2, "tag_id"=>4)
Tie.create("question_id"=>3, "tag_id"=>4)
Tie.create("question_id"=>4, "tag_id"=>4)
Tie.create("question_id"=>5, "tag_id"=>4)
Tie.create("question_id"=>5, "tag_id"=>3)
Tie.create("question_id"=>1, "tag_id"=>2)

User.create("name"=>"Benjamin", "email"=>"ben@mail.de", "password_digest"=>"$2a$10$hCxZvjIXgjmqMsWDi8xhYeHmfiXFpj3vtCYruhLUkLvXwqOIIzuUW")
