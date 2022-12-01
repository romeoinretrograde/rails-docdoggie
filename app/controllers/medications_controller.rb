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
    @all_weekdays = { "Sunday" => false, "Monday" => false, "Tuesday" => false, "Wednesday" => false, "Thursday" => false, "Friday" => false, "Saturday" => false }

    @medication.weekdays.each do |weekday|
      @all_weekdays[weekday] = true
    end
  end

  def index
    @medications = Medication.all
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
