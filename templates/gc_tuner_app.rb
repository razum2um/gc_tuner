gem 'spring'

unless ENV['TRAVIS']
  gem 'pry-byebug', group: [:development, :test]
  gem 'pry-stack_explorer', group: [:development, :test]
end

append_to_file 'Gemfile' do
  <<-CODE

    # new line is important
    gem 'gc_tuner', path: '../../'
  CODE
end

