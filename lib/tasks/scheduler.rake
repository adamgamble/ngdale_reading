desc "This task is called by the Heroku scheduler add-on"
task :send_alerts => :environment do
  ScheduledSmsAlert.first.alert_of_todays_reading
end
