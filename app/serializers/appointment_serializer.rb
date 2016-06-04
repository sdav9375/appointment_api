class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :start_time, :end_time, :comments
end
