class Appointment < ActiveRecord::Base
  include ActiveModel::Validations

  validates :first_name, :last_name, :start_time, :end_time, presence: true
  validate :appointment_start_and_end_time_is_in_the_future
  # validate :appointment_does_not_overlap_existing_appointments

  def appointment_start_and_end_time_is_in_the_future
    if start_time.present? && start_time < DateTime.now || end_time.present? && end_time < DateTime.now
      errors.add(:appointment_range, "Start and end times must be in the future")
    end
  end

  def appointment_range
      start_time...end_time
  end

  # def appointment_does_not_overlap_existing_appointments
  #   self.appointment_range.overlaps? (any appointment ranges)
  # end
  #
  # def






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
