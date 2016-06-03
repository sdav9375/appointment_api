class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :first_time, :last_name, :date, :start_time, :end_time, :comments
end
