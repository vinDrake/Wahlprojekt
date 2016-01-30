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
  [  "Wer ist Spiderman?" , "Peter Parker" , "Bruce Wayne" , "Tony Stark" , "Alfred der Butler" ],
  [  "Wie viele Länder hat Europa? (Hinweis: nicht die EU!)" , "47" , "45" , "42" , "51" ],
  [  "Nach welcher Stadt ist die erste deutsche Republik benannt?" , "Weimar" , "Bonn" , "Berlin" , "Frankfurt" ],
  [  "Wie viele Punkte muss ein Tischtennisspieler erzielen, damit ein Satz gewonnen ist?" , "11" , "21" , "13" , "18" ],
  [  "Wie nannte man den Vorläufer des Bundesministeriums für Verteidigung?" , "Amt Blank" , "Organisation Gehlen" , "Gauck-Behörde" , "Hartz-Kommision" ],
  [  "Was gibt es wirklich?" , "Menschenfressertomaten" , "Diebesradieschen" , "Kopfgeldzitronen" , "Mafiakarotten" ],
  [  "Welche ist die kleinste in Mitteleuropa beheimatete Maus?" , "Zwergmaus" , "Spitzmaus" , "Haselmaus" , "Zwergfledermaus" ],
  [  "Wie heißt der Hund von Obelix?" , "Idefix" , "Netflix" , "Odalix" , "Knuffix" ],
  [  "Für welche Kategorie gibt es keinen Nobelpreis?" , "Mathematik" , "Chemie" , "Physik" , "Wirtschaftswissenschaften" ],
  [  "Wie viele Quadratmeter sind ein Hektar?" , "10.000" , "1.000" , "100.000" , "100" ],
  [  "Welcher Planet ist der Sonne am nächsten?" , "Merkur" , "Venus" , "Jupiter" , "Neptun" ],
  [  "Wann wurde die Berliner Mauer abgerissen?" , "1989" , "1990" , "1991" , "1988" ],
  [  "Wann wurde Sedna entdeckt?" , "2003" , "2005" , "1998" , "2007" ],
  [  "Wie heißt der höchste Berg Deutschlands?" , "Zugspitze" , "Mount Everest" , "Matterhorn" , "Watzmann" ],
  [  "Wie hoch ist der höchste Berg der Erde?" , "8840m" , "8920m" , "8790" , "8810" ],
  [  "Wie viele Länder grenzen an die Schweiz?" , "5" , "4" , "6" , "7" ],
  [  "Mit welcher Filmrolle ist Pierre Brice berühmt geworden?" , "Winnetou" , "Titanic" , "Casablanca" , "Frühstück bei Tiffany" ],
  [  "Was enthält mehr Eisen?" , "Schokolade" , "Spinat" , "Rindfleisch" , "Milch" ],
  [  "Welche Tierhaut wurde früher als Schleifpapier benutzt?" , "Haifischhaut" , "Bieberhaut" , "Drachenhaut" , "Krokodilhaut" ],
  [  "Wer schrieb das Kinderbuch „Pippi Langstrumpf“?" , "Astrid Lindgren" , "Michael Ende" , "Joanne K. Rowling" , "Erich Kästner" ],
  [  "Wer war der Begründer der Psychoanalyse?" , "Sigmund Freud" , "Epikur" , "Immanuel Kant" , "Niccolò Machiavelli" ],
  [  "Welches Medikament gewinnt man aus Schimmelpilz?" , "Penicillin" , "Aspirin" , "Paracetamol" , "Morphin" ],
  [  "Welcher Stil wurde Picasso zugeordnet?" , "Surrealismus" , "Realismus" , "Expressionismus" , "Pop Art" ],
  [  "In welchem Jahr begann die Französische Revolution?" , "1789" , "1879" , "1978" , "1897" ],
  [  "Welcher König von Frankreich hatte den Beinamen “Sonnenkönig“?" , "Ludwig XIV" , "Karl VI" , "Napoleon" , "Franz II" ],
  [  "Von welchem Land trennte sich Norwegen 1905?" , "Schweden" , "Finnland" , "Lettland" , "Litauen" ],
  [  "Wie viel Spieler gibt es beim Rugby?" , "30" , "20" , "22" , "34" ],
  [  "Wann wurde der Tonfilm erfunden?" , "1928" , "1941" , "1905" , "1898" ],
  [  "Wer führte bei den Römern das Schaltjahr ein?" , "Caesar" , "Nero" , "Augustus" , "Remus" ],
  [  "Was verbirgt sich hinter der Bezeichnung „Pizza Connection“?" , "Heroinhändlerring" , "Lieferdienst" , "Spielfilm" , "Drogenkartell" ],
  [  "Welches Landtier kann am schnellsten laufen?" , "Gepard" , "Rennmaus" , "Windhund" , "Gazelle" ],
  [  "Welche Frucht hat pro 100 Gramm den größten Nährwert?" , "Avocado" , "Litschi" , "Banane" , "Zitrone" ],
  [  "Wie lang ist ein Tag auf dem Jupiter?" , "9 Stunden 50 Minuten" , "12 Stunden 30 Minuten" , "18 Stunden 40 Minuten" , "26 Stunden 10 Minuten" ]
  # [  "frage?" , "richtig" , "falsch" , "falsch" , "falsch" ],


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
  [ "Comics" , [ 1 , 2 , 3 ] ],
  [ "Astronomie" , [ 4 ] ],
  [ "Geografie" , [ 16 , 17 , 18 ] ],
  [ "Geschichte" , [ 26 , 27 , 28 ] ],
  [ "Ernährung" , [ 20 , 34 ] ],
  [ "Biologie" , [ 9 , 24 ] ]
#  [ "tag" , [ 1 , 2 , 3 ] ]

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
  c = Challenge.create( name: challenge[0] , alive: challenge[1] , max_challenge_time: challenge[2] , latest_end: challenge[3] , strict_order: challenge[4] , strikes: challenge[5]  )
  3.times do
    Element.create(challenge: c , question: Question.all.order("RANDOM()").first)
  end
end

# Um die Daten aus der Datenbank einzufügen siehe: lib/tasks/export.rake
