require 'rails_helper'

let(:appointment) { FactoryGirl.build(:appointment) }

RSpec.describe "Appointments", type: :request do

request tests
7) create should return JSON w/ status code
8) update should return nothing w/ status code
9) delete should return nothing w/ status code
10) list should return JSON w/ status code --


describe "Appointment API" do

#  GET '/api/v1/appointments'
  it 'lists all appointments in JSON' do
    FactoryGirl.create(:appointment, 10)
    get '/api/v1/appointments'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['appointments'].length).to eq(10)
  end

  describe "GET /appointments" do
    it "retrieves appointment records" do
      get "/api/v1/appointments"
      expect(response).to have_http_status(200)
    end
  end

#  POST '/api/v1/appointments'
  it 'posts a new record to database' do
  end

#  GET '/api/v1/appointment/1'
  it 'shows identified record in JSON' do

  end

#  PUT '/api/v1/appointment/1'
  it 'updates identified record and shows it in JSON' do

  end

#  DELETE ''
  it 'deletes identified record' do

  end

end

RSpec.describe "Appointments", type: :request do


  # describe "POST /appointments" do
  #   it "retrieves appointment records" do
  #     get "/api/v1/appointments"
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
