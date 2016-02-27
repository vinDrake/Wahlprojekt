# Exportieren der DatenbankInhalte in das seedFile
# Alle Modelle einfügen.
# Danach können Sie mit dem Befehl rake export:seeds_format den entsprechenden rake-„Task“ abrufen
# Oder direkt in seeds.rb umleiten mit: rake export:seeds_format >> db/seeds.rb


namespace :export do
  desc "Prints Country.all in a seeds.rb way."
  task :seeds_format => :environment do
    # Anfang BeispielCode
    # Country.order(:id).all.each do |country|
    #   puts "Country.create(#{country.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    # end
    # Ende BeispielCode

    # Alle Models müssen in dem Array enthalten sein.
    models = [Answer, Challenge, Element, Feed, Feeder, Group, Membership, Message, Participation, Question, Repley, Selection, Tag, Tie, User]

    models.each do |model|

      model.order(:id).all.each do |instance|
        puts model.to_s+".create(#{instance.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end


  end
end
