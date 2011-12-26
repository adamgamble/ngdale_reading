class CreateDailyReadings < ActiveRecord::Migration
  def change
    create_table :daily_readings do |t|
      t.date :date
      t.string :daily_reading
      t.string :weekly_reading
      t.string :monthly_reading

      t.timestamps
    end
  end
end
