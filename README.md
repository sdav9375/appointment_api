

## APPOINTMENT API

The appointment API is build in Ruby on Rails using API mode. It returns appointments in JSON and will validate as follows:

  ### Validations (new appointments will not be saved if any of these fail): 

  - Presence of: first name, last name, start time (DateTime), end time (DateTime)
  - Start and end times must be in the future for newly created appointments
  - Appointments cannot overlap

If a date and time is entered into search query params, the API will return all appointments within that time frame. The search will return appointments based on if their start or end time falls within the range. 


###API location:

https://appointment-api-sd.herokuapp.com/api/v1/appointments

* Ruby version 2.3.0

* Database: Postgresql

* RSpec model validation testing: spec/models/appointment_spec.rb
 
* RSpec request testing: spec/requests/api/v1/appointments_spec.rb


### GET request

https://appointment-api-sd.herokuapp.com/api/v1/appointments

### POST request

http://appointment-api-sd.herokuapp.com/api/v1/appointments
body: { appointment: {first_name: "tom", last_name: "jones", start_time: "8/1/16 7:00", end_time: "8/1/16 8:00"} })

### PATCH request

http://appointment-api-sd.herokuapp.com/api/v1/appointments/4
body: { appointment: {first_name: "tom", last_name: "jones", start_time: "8/1/16 7:00", end_time: "8/1/16 8:00"} })

* Please note: to update one field, all fields must be entered

### DELETE request

http://appointment-api-sd.herokuapp.com/api/v1/appointments/4 


