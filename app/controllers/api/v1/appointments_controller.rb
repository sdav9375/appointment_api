module Api::V1

  class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]


    # GET /api/v1/appointments
    # GET /api/v1/appointments.json
    def index
      if appointment_params[:start_time] && appointment_params[:end_time]
        query_start = appointment_params[:start_time]
        query_end = appointment_params[:end_time]
        @appointments = Appointment.where(
                        query_start <= appointment_params[:start_time] <= query_end ||
                        query_start <= appointment_params[:end_time] <= query_end
                        )
        render :json => @appointments, status: :ok
      else
        @appointments = Appointment.all
        render :json => @appointments, status: :ok
      end
    end

    # GET /api/v1/appointments/1
    # GET /api/v1/appointments/1.json
    def show
      render json: @appointment
    end

    # POST /api/v1/appointments
    # POST /api/v1/appointments.json
    def create
      @appointment = Appointment.new(correct_params)
      if @appointment.save
        render json: @appointment, status: :created, location: @appointment_params
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/appointments/1
    # PATCH/PUT /api/v1/appointments/1.json
    def update
      if @appointment.update(correct_params)
        head :no_content
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/appointments/1
    # DELETE /api/v1/appointments/1.json
    def destroy
      @appointment.destroy
      head :no_content
    end

    private

    def correct_params
      new_params = appointment_params
      new_params[:start_time] = DateTime.strptime(appointment_params[:start_time], '%m/%d/%y %H:%M')
      new_params[:end_time] = DateTime.strptime(appointment_params[:end_time], '%m/%d/%y %H:%M')
      new_params
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def query_params
      params.permit(:first_name, :last_name, :date, :start_time, :end_time, :comments)
    end

    def appointment_params
      params.require(:appointment).permit(:first_name, :last_name, :start_time, :end_time, :comments)

    end
  end
end
