require 'rails_helper'

RSpec.describe "Appointment API requests", type: :request do


  describe "GET api/v1/appointments" do

    let(:appointment_1) {{
      first_name: "jane",
      last_name: "smith",
      comments: "test",
      start_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M'),
      end_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M')
      }}

    let(:appointment_2) {{
      first_name: "john",
      last_name: "doe",
      comments: "test",
      start_time: DateTime.strptime("8/1/16 9:30", '%m/%d/%y %H:%M'),
      end_time: DateTime.strptime("8/1/16 9:30", '%m/%d/%y %H:%M')
      }}

    let(:appointment_3) {{
      first_name: "bob",
      last_name: "brown",
      comments: "test",
      start_time: DateTime.strptime("9/1/16 9:30", '%m/%d/%y %H:%M'),
      end_time: DateTime.strptime("9/1/16 9:30", '%m/%d/%y %H:%M')
      }}

    it 'lists all appointments in JSON' do

      Appointment.create! appointment_1
      Appointment.create! appointment_2
      Appointment.create! appointment_3
      get '/api/v1/appointments'
      json = JSON.parse(response.body)
      expect(response.content_type).to eq("application/json")
      expect(response).to be_success
      expect(Appointment.all.length).to eq(3)
    end
  end

  describe "POST api/v1/appointments" do
    it 'posts a new record to database' do
      headers = { "CONTENT_TYPE" => "application/json" }
      post '/api/v1/appointments', :appointment => {
                                                     first_name: "jane",
                                                     last_name: "smith",
                                                     comments: "test",
                                                     start_time: "7/1/16 9:30",
                                                     end_time: "7/1/16 9:35"
                                                   }
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET api/v1/appointment/appointment_params[:id]" do

    let(:appointment_1) {{
      first_name: "jane",
      last_name: "smith",
      comments: "test",
      start_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M'),
      end_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M')
      }}

    it 'retrieves a specific appointment' do
      appointment = Appointment.create! appointment_1
      get "/api/v1/appointments/#{appointment.id}"
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json).not_to be_nil
    end
  end


  describe "PATCH api/v1/apppointment/appointment_params[:id]" do
    let(:valid_attributes) {
      {
      first_name: "jane",
      last_name: "smith",
      comments: "test",
      start_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M'),
      end_time: DateTime.strptime("7/1/16 9:30", '%m/%d/%y %H:%M')
      }
    }

    it 'updates identified appointment' do
      appointment = Appointment.create! valid_attributes
      put "/api/v1/appointments/#{appointment.id}", { appointment:
                                                      { first_name: "john",
                                                        last_name: "doe",
                                                        comments: "test",
                                                        start_time: "8/1/16 9:30",
                                                        end_time: "8/1/16 9:30"
                                                      }
                                                    }
      appointment.reload
      expect(response).to have_http_status(204)
      expect(Appointment.last.first_name).to eq("john")
    end
  end

  describe 'DELETE api/v1/appointment/appointment_params[:id]' do
    it "destroys the requested appointment" do
      appointment = FactoryGirl.create(:appointment)
      expect {
        delete "/api/v1/appointments/#{appointment.id}"
      }.to change(Appointment, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
