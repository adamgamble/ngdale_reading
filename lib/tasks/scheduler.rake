desc "This task is called by the Heroku scheduler add-on"
task :send_alerts => :environment do
  ScheduledSmsAlert.for_alerting.each do |alert|
    alert.alert_of_todays_reading
  end
end
