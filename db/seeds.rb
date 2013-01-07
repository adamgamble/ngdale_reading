# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#   SECURITY WARNING: No secret option provided to Rack::Session::Cookie
DailyReading.create(:date => Date.today, :daily_reading => "Genesis 1:1", :weekly_reading => "Genesis 1:1", :monthly_reading => "Genesis 1:1")
