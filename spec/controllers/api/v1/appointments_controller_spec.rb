require 'rails_helper'
require 'spec_helper'

RSpec.describe "Appointment management", :type => :request do

  let(:appointment) { FactoryGirl.create(:appointment) }  #factorygirl

  it "creates an appointment" do
    headers = { "ACCEPT" => "application/json" }
    post "/appointments", { :appointment => {:name => "My Widget"} }, headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

end

describe "Messages API" do

  it 'sends a list of messages' do
    FactoryGirl.create_list(:message, 10)
    get '/api/v1/messages'
    json = JSON.parse(response.body)
    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json['messages'].length).to eq(10)
  end
end


# This should return the minimal set of attributes required to create a valid
# Appointment. As you add validations to Appointment, be sure to
# adjust the attributes here as well.
let(:valid_attributes) {
  skip("Add a hash of attributes valid for your model")
}

let(:invalid_attributes) {
  skip("Add a hash of attributes invalid for your model")
}

# This should return the minimal set of values that should be in the session
# in order to pass any filters (e.g. authentication) defined in
# AppointmentsController. Be sure to keep this updated too.
let(:valid_session) { {} }


describe "GET #index" do
  it "assigns all appointments as @appointments" do
    appointment = Appointment.create! valid_attributes
    get :index, {}, valid_session
    expect(assigns(:appointments)).to eq([appointment])
  end
end

describe "GET #show" do
  it "assigns the requested appointment as @appointment" do
    appointment = Appointment.create! valid_attributes
    get :show, {:id => appointment.to_param}, valid_session
    expect(assigns(:appointment)).to eq(appointment)
  end
end

describe "POST #create" do
  context "with valid params" do
    it "creates a new Appointment" do
      expect {
        post :create, {:appointment => valid_attributes}, valid_session
      }.to change(Appointment, :count).by(1)
    end

    it "assigns a newly created appointment as @appointment" do
      post :create, {:appointment => valid_attributes}, valid_session
      expect(assigns(:appointment)).to be_a(Appointment)
      expect(assigns(:appointment)).to be_persisted
    end

    it "redirects to the created appointment" do
      post :create, {:appointment => valid_attributes}, valid_session
      expect(response).to redirect_to(Appointment.last)
    end
  end

  context "with invalid params" do
    it "assigns a newly created but unsaved appointment as @appointment" do
      post :create, {:appointment => invalid_attributes}, valid_session
      expect(assigns(:appointment)).to be_a_new(Appointment)
    end

    it "re-renders the 'new' template" do
      post :create, {:appointment => invalid_attributes}, valid_session
      expect(response).to render_template("new")
    end
  end
end

describe "PUT #update" do
  context "with valid params" do
    let(:new_attributes) {
      skip("Add a hash of attributes valid for your model")
    }

    it "updates the requested appointment" do
      appointment = Appointment.create! valid_attributes
      put :update, {:id => appointment.to_param, :appointment => new_attributes}, valid_session
      appointment.reload
      skip("Add assertions for updated state")
    end

    it "assigns the requested appointment as @appointment" do
      appointment = Appointment.create! valid_attributes
      put :update, {:id => appointment.to_param, :appointment => valid_attributes}, valid_session
      expect(assigns(:appointment)).to eq(appointment)
    end

    it "redirects to the appointment" do
      appointment = Appointment.create! valid_attributes
      put :update, {:id => appointment.to_param, :appointment => valid_attributes}, valid_session
      expect(response).to redirect_to(appointment)
    end
  end

  context "with invalid params" do
    it "assigns the appointment as @appointment" do
      appointment = Appointment.create! valid_attributes
      put :update, {:id => appointment.to_param, :appointment => invalid_attributes}, valid_session
      expect(assigns(:appointment)).to eq(appointment)
    end

    it "re-renders the 'edit' template" do
      appointment = Appointment.create! valid_attributes
      put :update, {:id => appointment.to_param, :appointment => invalid_attributes}, valid_session
      expect(response).to render_template("edit")
    end
  end
end

describe "DELETE #destroy" do
  it "destroys the requested appointment" do
    appointment = Appointment.create! valid_attributes
    expect {
      delete :destroy, {:id => appointment.to_param}, valid_session
    }.to change(Appointment, :count).by(-1)
  end

  it "redirects to the appointments list" do
    appointment = Appointment.create! valid_attributes
    delete :destroy, {:id => appointment.to_param}, valid_session
    expect(response).to redirect_to(appointments_url)
  end
end

end
