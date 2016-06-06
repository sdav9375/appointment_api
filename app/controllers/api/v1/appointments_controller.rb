module Api::V1

  class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]

    before_save :corrected_params

    # GET /appointments
    # GET /appointments.json
    def index
      @appointments = Appointment.all
      render :json => @appointments, status: :ok
    end

    # GET /appointments/1
    # GET /appointments/1.json
    def show
      render json: @appointment
    end

    # POST /appointments
    # POST /appointments.json
    def create
      @appointment = Appointment.new(appointment_params)


      if @appointment.save
        render json: @appointment, status: :created, location: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /appointments/1
    # PATCH/PUT /appointments/1.json
    def update
      if @appointment.update(appointment_params)
        head :no_content
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /appointments/1
    # DELETE /appointments/1.json
    def destroy
      @appointment.destroy
      head :no_content
    end

    private

    def corrected_params
      start_time = appointment_params[:start_time]
      end_time = appointment_params[:end_time]
      appointment_params[:start_time] = DateTime.strptime(row['start_time'], '%m/%d/%y %H:%M')
      appointment_params[:end_time] = DateTime.strptime(row['end_time'], '%m/%d/%y %H:%M')
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def query_params
      params.permit(:first_name, :last_name, :date, :start_time, :end_time, :comments)
    end

    def appointment_params
      params.require(:appointment).permit(:first_name, :last_name, :date, :start_time, :end_time, :comments)

    end
  end
end
