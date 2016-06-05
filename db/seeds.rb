# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'csv'

csv_text = File.path(Rails.root.join('lib', 'seeds', 'appt_data.csv'))
csv = CSV.open(csv_text, :headers => true, :encoding => 'ISO-8859-1', skip_blanks: true).reject { |row| row.all?(&:nil?) }
csv.each do |row|
  t = Appointment.new
  t.first_name = row['first_name']
  t.last_name = row['last_name']
  t.comments = row['comments']
  t.start_time = DateTime.strptime(row['start_time'], '%m/%d/%y %H:%M')
  t.end_time = DateTime.strptime(row['end_time'], '%m/%d/%y %H:%M')
  t.save
end
