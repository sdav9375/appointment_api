require 'rails_helper'
require 'spec_helper'

RSpec.describe Appointment, type: :model do


  it "has a valid factory" do
    expect(FactoryGirl.create(:appointment)).to be_valid
  end

  it "is invalid without a first name" do
    expect(FactoryGirl.build(:appointment, first_name: nil)).not_to be_valid
  end

  it "is invalid without a last name" do
    expect(FactoryGirl.build(:appointment, last_name: nil)).not_to be_valid
  end

  it "is invalid without a start time" do
    expect(FactoryGirl.build(:appointment, start_time:  nil)).not_to be_valid
  end

  it "is invalid without an end time" do
    expect(FactoryGirl.build(:appointment, end_time: nil)).not_to be_valid
  end

  it "is invalid if start time is not in the future" do
    expect(FactoryGirl.build(:appointment, :start_time_in_past)).not_to be_valid
  end

  it "is invalid if end time is not in the future" do
    expect(FactoryGirl.build(:appointment, :end_time_in_past)).not_to be_valid
  end

  it "is invalid if start time or end time overlap other appointments" do
    expect(FactoryGirl.build(:appointment, :has_conflicting_appointment_with_seed)).not_to be_valid
  end
end
