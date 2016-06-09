

## APPOINTMENT API

The appointment API is build in Ruby on Rails using API mode. It returns appointments in JSON and will validate as follows:

Validations (new appointments will not be saved if any of these fail): 

Presence of: first name, last name, start time (DateTime), end time (DateTime)
Start and end times must be in the future for newly created appointments
Appointments cannot overlap

If DateTimes are entered into search query params, the API will return all appointments within that time frame. The search will return appointments based on if their start or end time falls within the range. 


API location:

https://appointment-api-sd.herokuapp.com/api/v1/appointments

* Ruby version 2.3.0

* Use Postman or HTTParty to use the API

* Database Postgresql

* RSpec model validation testing: spec/models/appointment_spec.rb
* RSpec request testing: spec/requests/api/v1/appointments_spec.rb



### HTTParty Get

HTTParty.get('http://appointment-api-sd.herokuapp.com/api/v1/appointments')

### HTTParty Post

HTTParty.post('http://appointment-api-sd.herokuapp.com/api/v1/appointments', body: { appointment: {first_name: "tom", last_name: "jones", start_time: "8/1/16 7:00", end_time: "8/1/16 8:00"} })

### HTTParty Patch

HTTParty.patch('http://appointment-api-sd.herokuapp.com/api/v1/appointments/4', body: { appointment: {first_name: "fred"} })

### HTTParty Delete

HTTParty.delete('http://appointment-api-sd.herokuapp.com/api/v1/appointments/4') 


