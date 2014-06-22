require "bundler/gem_tasks"
require 'bundler/setup'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--format progress"
end

Dir["#{File.expand_path('..', __FILE__)}/tasks/**/*.rake"].each { |f| load f }

desc 'pry console for gem'
task :c do
  require 'pry'
  require 'gc_tuner'
  ARGV.clear
  Pry.start
end

task :default => [:regenerate, :spec]

