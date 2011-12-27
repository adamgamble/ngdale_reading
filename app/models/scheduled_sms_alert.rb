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
end
