require 'rails_helper'
require 'spec_helper'

RSpec.describe Appointment, type: :model do

# describe Appointment do

  it "has a valid factory" do
    expect(FactoryGirl.create(:appointment)).to be_valid
  end

  it "is invalid without a first name" do
    expect(FactoryGirl.build(:appointment, first_name: nil)).not_to be_valid
  end

  # expect{}.to raise_error("First name must be provided")

  it "is invalid without a last name" do
    expect(FactoryGirl.build(:appointment, last_name: nil)).not_to be_valid
  end

  # expect{}.to raise_error("Last name must be provided")

  it "is invalid without a start time" do
    expect(FactoryGirl.build(:appointment, start_time: nil)).not_to be_valid
  end

  # expect{}.to raise_error("Start time must be provided")

  it "is invalid without an end time" do
    expect(FactoryGirl.build(:appointment, end_time: nil)).not_to be_valid
  end

  # expect{}.to raise_error("End time must be in the future")

  it "is invalid if start time is not in the future"
  # expect(:appointment).to equal(nil)
  # expect{}.to raise_error("Start time must be in the future")

  it "is invalid if end time is not in the future"
  # expect(:appointment).to equal(nil)
  # expect{}.to raise_error("End time must be in the future")


  it "is invalid if start time or end time overlap other appointments"
  # expect(:appointment).to equal(nil)
  # expect{}.to raise_error("Appointment is overlapping another appointment")

end
