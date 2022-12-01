class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[show edit update destroy]

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      puts "Medication saved"
    else
      puts "Medication not saved"
    end
  end

  def show
  end

  # <% time = medication.hours %>
  # <% @hours = time.hour %>
  # <% if @hours < 13 %> <%# ...12 %>

  # <% elsif @hours > 12 && @hours < 19  %> <%# 13-18 %>

  # <% else %> <%# 19... %>

  # <% end %>


  def index
    @all_medications = Medication.where(user: current_user)

    @morning_medications = []
    @afternoon_medications = []
    @night_medications = []

    @all_medications.each do |medication|
      time = medication.hours
      @hours = time.hour # Returns an integer
      if @hours < 13
        @morning_medications << medication
      elsif @hours > 12 && @hours < 19
        @afternoon_medications << medication
      else
        @night_medications << medication
      end
    end
  end

  def edit
  end

  def update
    @medication.update(medication_params)
    redirect_to medication_path(@medication)
  end

  def destroy
    @medication.destroy
    redirect_to medications_path
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :dosage, :hours, :taken, :purpose, :weekdays)
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end
end
