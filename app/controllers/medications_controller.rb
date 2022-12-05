class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[show edit update destroy]

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
    # @medication.weekdays = @medication.weekdays.drop(1)
    @medication.weekdays = ["Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"] if @medication.weekdays.include?("All")

    @medication.user = current_user
    if @medication.save
      redirect_to medications_path
    else
      redirect_to new_medication_path
    end
  end

  def show
    @all_weekdays = { "Sunday" => false,
                      "Monday" => false,
                      "Tuesday" => false,
                      "Wednesday" => false,
                      "Thursday" => false,
                      "Friday" => false,
                      "Saturday" => false }
    @medication.weekdays.reject { |medication| medication == "" }.each do |weekday|
      @all_weekdays[weekday] = true
    end
  end

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

    @all_weekdays = { "Sunday" => false,
      "Monday" => false,
      "Tuesday" => false,
      "Wednesday" => false,
      "Thursday" => false,
      "Friday" => false,
      "Saturday" => false }
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
    params.require(:medication).permit(:name, :dosage, :hours, :taken, :purpose, :description, weekdays: [])
  end

  def set_medication
    @medication = Medication.find(params[:id])
  end
end
