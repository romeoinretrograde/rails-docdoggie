class TakenMedicationsController < ApplicationController
  def create
    @taken_medication = TakenMedication.new(taken_date: DateTime(
      Time.now.year.to_i,
      Time.now.month.to_i,
      Time.now.day.to_i,
      Time.now.hour.to_i,
      Time.now.minute.to_i
    ))
    @taken_medication.save
  end

  # private

  # def taken_medication_params
  #   params.require(:taken_medication).permit(:taken_date)
  # end
end
