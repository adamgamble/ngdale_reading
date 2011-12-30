load 'lib/twilio.rb'
class SmsController < ApplicationController

  def reply
    @twilio_client = TwilioClient.client
    @scheduled_sms_alert = ScheduledSmsAlert.find_by_number(params["From"])

    case params["Body"].downcase
    when /bible (\d+:\d{2} ?(AM|am|PM|pm))$/i
      matches = params["Body"].scan /bible (\d+:\d{2} ?(AM|am|PM|pm))$/i
      time = Time.zone.parse(matches.flatten[0])
      @scheduled_sms_alert = ScheduledSmsAlert.new(:number => params["From"]) unless @scheduled_sms_alert
      @scheduled_sms_alert.time = time
      @scheduled_sms_alert.authorize!
      @scheduled_sms_alert.save
      response = Twilio::TwiML::Response.new do |r|
        r.Sms "You will now receive daily bible reminders at #{time.zone.strftime("%I:%M %p")}", :to => params["From"], :from => "12052891112"
      end
    when "cancel bible"
      response = Twilio::TwiML::Response.new do |r|
        r.Sms 'You have cancelled all future reminders', :to => params["From"], :from => "12052891112"
      end
      @scheduled_sms_alert.cancel!
    else
      response = Twilio::TwiML::Response.new do |r|
        r.Sms 'I didn\'t understand what you wanted. Valid choices are bible 5:30PM and cancel bible', :to => params["From"], :from => "12052891112"
      end
    end
    render :text => response.text
  end
end
