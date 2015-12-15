# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Um die Daten aus der Datenbank hier einzufügen siehe: lib/tasks/export.rake
  [1m[36mAnswer Load (1.6ms)[0m  [1mSELECT "answers".* FROM "answers"  ORDER BY "answers"."id" ASC[0m
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
  [1m[35mChallenge Load (2.8ms)[0m  SELECT "challenges".* FROM "challenges"  ORDER BY "challenges"."id" ASC
Challenge.create("name"=>"Comicverfilmungen", "alive"=>true, "max_challenge_time"=>1, "latest_end"=>Wed, 16 Dec 2015 12:29:00 UTC +00:00, "strict_order"=>false, "strikes"=>1)
Challenge.create("name"=>"Höhere Mathematik", "alive"=>true, "max_challenge_time"=>1, "latest_end"=>Wed, 16 Dec 2015 12:30:00 UTC +00:00, "strict_order"=>false, "strikes"=>1)
  [1m[36mElement Load (1.3ms)[0m  [1mSELECT "elements".* FROM "elements"  ORDER BY "elements"."id" ASC[0m
Element.create("challenge_id"=>1, "question_id"=>2)
Element.create("challenge_id"=>1, "question_id"=>3)
Element.create("challenge_id"=>1, "question_id"=>4)
Element.create("challenge_id"=>1, "question_id"=>5)
Element.create("challenge_id"=>2, "question_id"=>1)
  [1m[35mFeed Load (1.3ms)[0m  SELECT "feeds".* FROM "feeds"  ORDER BY "feeds"."id" ASC
Feed.create("priority"=>1, "feeder_id"=>1, "question_id"=>1)
  [1m[36mFeeder Load (1.2ms)[0m  [1mSELECT "feeders".* FROM "feeders"  ORDER BY "feeders"."id" ASC[0m
Feeder.create("user_id"=>1)
  [1m[35mGroup Load (1.1ms)[0m  SELECT "groups".* FROM "groups"  ORDER BY "groups"."id" ASC
Group.create("name"=>"Club der toten Dichter")
Group.create("name"=>"Avengers")
  [1m[36mMembership Load (1.2ms)[0m  [1mSELECT "memberships".* FROM "memberships"  ORDER BY "memberships"."id" ASC[0m
Membership.create("user_id"=>1, "group_id"=>1)
  [1m[35mMessage Load (1.1ms)[0m  SELECT "messages".* FROM "messages"  ORDER BY "messages"."id" ASC
  [1m[36mParticipation Load (1.1ms)[0m  [1mSELECT "participations".* FROM "participations"  ORDER BY "participations"."id" ASC[0m
  [1m[35mQuestion Load (1.1ms)[0m  SELECT "questions".* FROM "questions"  ORDER BY "questions"."id" ASC
Question.create("problem"=>"Was ist 1 + 1?")
Question.create("problem"=>"Welche geheime Identität hat Bruce Wayne?")
Question.create("problem"=>"Welche geheime Identität hat Clark Kent?")
Question.create("problem"=>"Welche geheime Identität hat Berry Allen?")
Question.create("problem"=>"Welche geheime Identität hat Peter Parker?")
  [1m[36mRepley Load (1.2ms)[0m  [1mSELECT "repleys".* FROM "repleys"  ORDER BY "repleys"."id" ASC[0m
Repley.create("user_id"=>1, "question_id"=>1, "answer_id"=>2)
  [1m[35mSelection Load (3.0ms)[0m  SELECT "selections".* FROM "selections"  ORDER BY "selections"."id" ASC
  [1m[36mTag Load (1.0ms)[0m  [1mSELECT "tags".* FROM "tags"  ORDER BY "tags"."id" ASC[0m
Tag.create("name"=>"-")
Tag.create("name"=>"Mathe")
Tag.create("name"=>"Filme")
Tag.create("name"=>"Comics")
  [1m[35mTie Load (3.2ms)[0m  SELECT "ties".* FROM "ties"  ORDER BY "ties"."id" ASC
Tie.create("question_id"=>2, "tag_id"=>3)
Tie.create("question_id"=>3, "tag_id"=>3)
Tie.create("question_id"=>4, "tag_id"=>3)
Tie.create("question_id"=>2, "tag_id"=>4)
Tie.create("question_id"=>3, "tag_id"=>4)
Tie.create("question_id"=>4, "tag_id"=>4)
Tie.create("question_id"=>5, "tag_id"=>4)
Tie.create("question_id"=>5, "tag_id"=>3)
Tie.create("question_id"=>1, "tag_id"=>2)
  [1m[36mUser Load (1.2ms)[0m  [1mSELECT "users".* FROM "users"  ORDER BY "users"."id" ASC[0m
User.create("name"=>"Benjamin", "email"=>"ben@mail.de", "password_digest"=>"$2a$10$hCxZvjIXgjmqMsWDi8xhYeHmfiXFpj3vtCYruhLUkLvXwqOIIzuUW")
