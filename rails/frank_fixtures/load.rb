def reset
  puts `RAILS_ENV=test rake db:reset db:seed`
end

def load_fixture(fixture)
  load fixture
end

if ARGV.length == 0
  puts "usage: rails r #{__FILE__} <FIXTURE_FILE>"
else
  reset
  load_fixture ARGV[0]

  require 'fileutils'
  FileUtils.touch('./tmp/frank_ready')
end
