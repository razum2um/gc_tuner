generate 'scaffold User name:string --no-test-framework'

# FIXME: uninitialized constant User (NameError) in last creation line
append_to_file 'config/environment.rb' do
  <<-CODE
    $:.unshift File.expand_path('../../app/models', __FILE__)
  CODE
end

file 'lib/tasks/db.rake', force: true do
  <<-CODE
    namespace :db do
      desc 'fills in data'
      task :import => :environment do
        10_000.times do |n|
          User.where(name: "user_\#{n}").first_or_create
        end
      end
    end
  CODE
end

