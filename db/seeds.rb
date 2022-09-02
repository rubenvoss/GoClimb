require "open-uri"
require 'faker'

# this loads all the seed files, sorted (00, 01, 02, 03, ...)
# seed files are located in seeds directory
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end