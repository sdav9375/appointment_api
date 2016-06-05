FactoryGirl.define do
  factory :appointment do

    first_name "jane"
    last_name "smith"
    comments "test"
    start_time DateTime.strptime("6/1/16 9:30", '%m/%d/%y %H:%M')
    end_time DateTime.strptime("6/1/16 9:35", '%m/%d/%y %H:%M')

  end
end
