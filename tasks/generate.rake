EXAMPLE_APP = 'tmp/gc_tuner_app'
EXAMPLE_PATH = File.expand_path("../../#{EXAMPLE_APP}", __FILE__)

namespace :clobber do
  desc "clobber the generated app"
  task :app do
    FileUtils.mkdir_p EXAMPLE_PATH
    in_gc_tuner_app "bin/spring stop" rescue nil
    Dir.chdir EXAMPLE_PATH do
      Dir.glob("*", File::FNM_DOTMATCH).each do |fname|
        next if fname == '.' || fname == '..' || fname == '.git' || fname == '.bundle'
        FileUtils.rm_rf fname
      end
    end
  end
end

namespace :generate do
  desc "generate a fresh app with rspec installed"
  task :app do |t|
    if needs_generation?
      sh "bundle exec rails new #{EXAMPLE_APP} -m #{File.expand_path '../../templates/gc_tuner_app.rb', __FILE__} --skip-javascript --skip-git --skip-test-unit --skip-keeps --skip-bundle --quiet"
      in_gc_tuner_app "bundle config --local local.gc_tuner $PWD/../.." unless ENV['TRAVIS']
      in_gc_tuner_app "bundle install"
      %w[rake spring].each do |gem|
        in_gc_tuner_app "bundle binstubs #{gem}"
      end
    end
  end

  desc "generate a bunch of stuff with generators"
  task :stuff do
    in_gc_tuner_app "LOCATION='../../templates/generate_stuff.rb' bin/rake rails:template --quiet --silent"

    unless ENV['TRAVIS']
      in_gc_tuner_app 'bin/rake db:migrate'
      in_gc_tuner_app 'bin/rake db:import'
    end
    in_gc_tuner_app 'bin/rake RAILS_ENV=test db:migrate'
    in_gc_tuner_app 'bin/rake RAILS_ENV=test db:import'
  end
end

def in_gc_tuner_app(command)
  FileUtils.mkdir_p(EXAMPLE_PATH)
  Dir.chdir(EXAMPLE_PATH) do
    Bundler.with_clean_env do
      sh command
    end
  end
end

def needs_generation?
  !File.exists?("#{EXAMPLE_PATH}/Gemfile")
end

desc 'destroys & recreates new test app'
task :regenerate => ["clobber:app", "generate:app", "generate:stuff"]

