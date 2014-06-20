require "./initialize"

Dir.glob("./lib/tasks/*").sort.each { |file| import file }

def exports
  "ENV=#{Arrival.env} RACK_ENV=#{Renotify.env}"
end

task :start do
  puts "Starting renotify in #{Renotify.env}"
  system("bundle exec thin -o 8080 start -d -l #{Renotify.log_dir}/thin.log") # start api
end

task :stop do
  system("bundle exec thin -o 8080 stop; true") # stop api
end
