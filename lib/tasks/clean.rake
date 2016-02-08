

namespace :clean do
  desc "This task cleans the DB"
  task :one => :environment do
    Feed.find(2).destroy
  end
end
