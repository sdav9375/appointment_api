require 'rails_helper'

let(:appointment) { FactoryGirl.build(:appointment) }

request tests
7) create should return JSON w/ status code
8) update should return nothing w/ status code
9) delete should return nothing w/ status code
10) list should return JSON w/ status code --




RSpec.describe "Appointments", type: :request do

  describe "GET /appointments" do
    it "retrieves appointment records" do
      get "/api/v1/appointments"
      expect(response).to have_http_status(200)
    end
  end


  # describe "POST /appointments" do
  #   it "retrieves appointment records" do
  #     get "/api/v1/appointments"
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
