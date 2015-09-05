namespace :heroku do
  desc "Scale Heroku dyno up to activate app"
  task scale_dyno_up: :environment do
    puts "***** Scaling dyno up *****"
    heroku = PlatformAPI.connect_oauth(ENV['PLATFORM_API_TOKEN'])
    heroku.formation.update('tsadra', 'web', {'quantity': 1})
  end

  desc "Scale Heroku dyno down to force app to sleep"
  task scale_dyno_down: :environment do
    puts "***** Scaling dyno down *****"
    heroku = PlatformAPI.connect_oauth(ENV['PLATFORM_API_TOKEN'])
    heroku.formation.update('tsadra', 'web', {'quantity': 0})
  end
end