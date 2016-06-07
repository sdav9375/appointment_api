FactoryGirl.define do
  factory :appointment do
    first_name "jane"
    last_name "smith"
    comments "test"
    start_time DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M')
    end_time DateTime.strptime("7/1/16 9:35", '%m/%d/%y %H:%M')
  end

  trait :start_time_in_past do
    start_time { 1.day.ago }
  end

  trait :end_time_in_past do
    end_time { 1.day.ago }
  end

  trait :has_conflicting_appointment_with_seed do
    start_time DateTime.strptime("11/1/13 7:00", '%m/%d/%y %H:%M')
    end_time DateTime.strptime("11/1/13 7:30", '%m/%d/%y %H:%M')
  end
end
