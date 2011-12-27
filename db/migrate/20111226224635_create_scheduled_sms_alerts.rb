class CreateScheduledSmsAlerts < ActiveRecord::Migration
  def change
    create_table :scheduled_sms_alerts do |t|
      t.string :number
      t.string :state
      t.time :time

      t.timestamps
    end
  end
end
