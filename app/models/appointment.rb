class Appointment < ActiveRecord::Base

  validates :first_name, :last_name, :start_time, :end_time, presence: true
  # validate :conflicting_appts



  #
  # def appt_range
  #   start_time..end_time
  #  end
  #
  #
  #  protected
  #  def conflicting_appts
  #   @appointments = Appointment.all(:conditions => { :date_of_appointment => date_of_appointment, :doctor_id => doctor_id})
  #   errors.add_to_base("Appointment Conflict") if @appointments.any? {|appt| appt.appt_range.overlaps? appt_range}
  # end
end
