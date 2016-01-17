

namespace :clean do
  desc "This task cleans the DB"
  task :one do
    Feed.find(2).destroy
  end
end
