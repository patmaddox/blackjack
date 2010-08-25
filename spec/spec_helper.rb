require 'rubygems'
require 'rspec'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each do |ruby_file|
  require ruby_file
end

class OneAtATimeReporter < RSpec::Core::Reporter
  def example_started(example)
    super unless @has_failed
  end

  def example_failed(example)
    unless @has_failed
      @has_failed = true
      super
    end
  end
end

class RSpec::Core::Configuration
  def reporter
    @reporter ||= OneAtATimeReporter.new(formatter)
  end
end

