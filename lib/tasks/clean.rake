

namespace :clean do
  desc "This task cleans the DB"
  task :1 do
    Feed.find(2).destroy
  end
end
