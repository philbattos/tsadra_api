namespace :heroku do
  desc "Scale Heroku dyno up to activate app"
  task :scale_dyno_up => :environment do
    puts "***** Scaling dyno up *****"
    Bundler.with_clean_env do
      sh "heroku ps:scale web=1"
    end
  end

  desc "Scale Heroku dyno down to force app to sleep"
  task :scale_dyno_down => :environment do
    puts "***** Scaling dyno down *****"
    Bundler.with_clean_env do
      sh "heroku ps:scale web=0"
    end
  end
end