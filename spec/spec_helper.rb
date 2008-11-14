require 'rubygems'
require 'spec'

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each do |ruby_file|
  require ruby_file
end

class OneAtATimeReporter < Spec::Runner::Reporter
  def example_started(example)
    super unless @has_failed
  end

  def example_failed(example, error)
    unless @has_failed
      @has_failed = true
      super
    end
  end

  def example_finished(example, error=nil)
    super unless @has_failed
  end
end

Spec::Runner.options.reporter = OneAtATimeReporter.new(Spec::Runner.options)



