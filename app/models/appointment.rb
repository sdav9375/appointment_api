# class ConflictValidator < ActiveModel::Validator
#   def validate(appointment)
#     unless appointment[:start].name.starts_with? 'X'
#       record.errors[:name] << 'Need a name starting with X please!'
#     end
#   end
# end
#
# class Person
#   include ActiveModel::Validations
#   validates_with MyValidator
# end
#
# @booked_session.each do |aSession|
#   if (aSession.start_time..aSession.end_time).overlaps?(@start_time..@end_time) respond_to do |format|

class Appointment < ActiveRecord::Base
  include ActiveModel::Validations


  validates :first_name, :last_name, :start_time, :end_time, presence: true
#   validate :conflicting_appts
#   validate :appointment_range_in_future
#   validates_with ConflictValidator
#



#
#
# take all appointments
# if new appointment range overlaps any appointment range, not valid
#





#   def overlap?(x,y)
#     (x.first - y.end) * (y.first - x.end) > 0
#   end
#   #
#   def appt_range
#     start_time..end_time
#    end
#
#   ( start1 <= end2 and start2 <= end1 )
#
#   If Date.Compare(period1_start, period2_end) <= 0 And Date.Compare(period1_end, period2_start) >= 0 Then
#
# Return True
#
# End If
#
# Return False
#
# End Function
#
# Posted on Thursday, April 26, 2007 12:39 AM VB.Net | Back to top
#
#
#    private
#    def conflicting_appts
#     @appointments = Appointment.all(:conditions => { :date_of_appointment => date_of_appointment, :doctor_id => doctor_id})
#     errors.add_to_base("Appointment Conflict") if @appointments.any? {|appt| appt.appt_range.overlaps? appt_range}
#   end
#
end
