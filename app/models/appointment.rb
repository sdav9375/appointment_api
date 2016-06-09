class Appointment < ActiveRecord::Base
  include ActiveModel::Validations

  validates :first_name, :last_name, :start_time, :end_time, presence: true
  validate :appointment_start_and_end_time_is_in_the_future
  validate :appointment_does_not_overlap_existing_appointments

  def appointment_start_and_end_time_is_in_the_future
    if start_time.present? && start_time < DateTime.now || end_time.present? && end_time < DateTime.now
      errors.add(:appointment_range, "Start and end times must be in the future")
    end
  end

  def appointment_range
    start_time...end_time
  end

  def appointment_does_not_overlap_existing_appointments
    @appointments = Appointment.all
    @appointment = Appointment.new
    if @appointments.any? {|appt| appt.appointment_range.overlaps? @appointment.appointment_range}
      errors.add("Appointments cannot overlap")
    end
  end
end
