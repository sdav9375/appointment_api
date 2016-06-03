FactoryGirl.define do
  factory :appointment do

    first_name "jane"
    last_name "smith"


  end
end

t.string   "first_name"
t.string   "last_name"
t.date     "date"
t.time     "start_time"
t.time     "end_time"
t.text     "comments"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
