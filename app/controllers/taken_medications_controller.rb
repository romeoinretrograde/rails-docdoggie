class TakenMedicationsController < ApplicationController
  def create
    @medication = Medication.find(params[:medication_id])
    @taken_medication = TakenMedication.new(taken_date: DateTime.now)
    @taken_medication.medication = @medication
    @taken_medication.save
    redirect_to dashboard_path, notice: "Medication taken"
  end
end
