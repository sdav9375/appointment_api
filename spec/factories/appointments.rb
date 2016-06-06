FactoryGirl.define do
  factory :appointment do
    first_name "jane"
    last_name "smith"
    comments "test"
    start_time "6/1/16 9:30"
    end_time "6/1/16 9:35"
  end

  trait :start_time_in_past do
    start_time { 1.day.ago }
  end

  trait :end_time_in_past do
    end_time { 1.day.ago }
  end
end


# start_time DateTime.strptime("6/1/16 9:30", '%m/%d/%y %H:%M')
# end_time DateTime.strptime("6/1/16 9:35", '%m/%d/%y %H:%M')
