class TakenMedicationsController < ApplicationController
  def create
    @medication = Medication.find(params[:medication_id])
    @taken_medication = TakenMedication.new(taken_date: DateTime.now)
    @taken_medication.medication = @medication
    @taken_medication.save
    redirect_to dashboard_path, notice: "Medication taken"

  end

  def feed
    # current_user.taken_medications.each do |taken_med|
    #   taken_med.update(feed: true)
    @taken_meds = current_user.taken_medications.where(feed: false)
    unless @taken_meds.empty?
      @taken_meds.last.update(feed: true)
      # Do the animation here
      redirect_to dashboard_path
    end
  end
end
