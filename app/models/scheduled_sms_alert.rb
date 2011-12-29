load 'lib/twilio.rb'
class ScheduledSmsAlert < ActiveRecord::Base

    state_machine :state, :initial => :requested do

      state :requested
      state :authorized
      state :cancelled

      event :cancel! do
        transition [:requested, :authorized] => :cancelled
      end

      event :authorize! do
        transition [:cancelled, :authorized, :requested] => :authorized
      end
    end

    scope :for_alerting, lambda { where("time BETWEEN ? and ?", Time.now - 5.minutes, Time.now + 5.minutes)}

    def alert_of_todays_reading
      @daily_reading = DailyReading.first
      TwilioClient.client.account.sms.messages.create(
        :from => "12052891112",
        :to => number,
        :body => "Today's Readings - Daily: #{@daily_reading.daily_reading} - Weekly: #{@daily_reading.weekly_reading} - Monthly: #{@daily_reading.monthly_reading}"
      )
    end
end
