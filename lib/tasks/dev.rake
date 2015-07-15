namespace :dev do
  desc "Build the system"
  task :build => ["db:drop", "db:create", "db:migrate"]
  desc "Rebuild the system with data"
  task :rebuild => ["dev:build", "db:seed"]
end