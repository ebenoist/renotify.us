%w(. ./lib/ ./config/).each do |path|
  $: << path
end

require "bundler"
Bundler.setup

require "renotify"
Dir.glob("./lib/initializers/*").sort.each { |file| require file }
