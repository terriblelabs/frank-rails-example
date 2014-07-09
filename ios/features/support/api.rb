unless ENV['API_FIXTURE_DIR']
  raise "ENV['API_FIXTURE_DIR'] must be defined."
end

module Api
  def self.with_fixture(tags, &block)
    fixture_file = fixture_file(tags)
    if fixture_file
      FixtureLoader.new(fixture_file: fixture_file).load
    end

    block.call
  end

  def self.fixture_file(tags)
    tag = fixture_tag(tags)
    return unless tag

    File.join(ENV['API_FIXTURE_DIR'], "#{tag.gsub(/@api_fixture_/, '')}.rb").tap do |file|
      raise "fixture file #{file} does not exist" unless File.exists?(file)
    end
  end

  def self.fixture_tag(tags)
    tags.detect do |tag|
      tag =~ /@api_fixture_/
    end
  end

  class FixtureLoader
    attr_accessor :fixture_file

    def initialize(options)
      options.each do |k,v|
        self.send("#{k}=", v)
      end
    end

    def load
      ready_file = File.expand_path("#{ENV['API_FIXTURE_DIR']}/../") + "/tmp/frank_ready"

      File.delete(ready_file) if File.exist?(ready_file)

      @pid = spawn %( echo "RAILS_ENV=test rails r #{arguments}" > #{File.expand_path("#{ENV['API_FIXTURE_DIR']}/../")}/commands)

      while !File.exist?(ready_file)
        sleep 0.1
      end
    end

    private
    def bin
      "bundle exec rails r"
    end

    def arguments
      [
        File.join(ENV['API_FIXTURE_DIR'], "load.rb"),
        fixture_file
      ].join(' ')
    end
  end
end

Around do |scenario, block|
  Api.with_fixture(scenario.source_tag_names, &block)
end
