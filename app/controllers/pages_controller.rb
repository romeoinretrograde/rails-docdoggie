class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @doggie = @user.doggie
    @days_together = (Time.now - @doggie.created_at).to_i / 86_400
    send_alert
  end

  def profile
  end

  def calendar
  end

  private

  def send_alert
    @weekday_today = Time.now.strftime("%A")
    @all_medications = Medication.where(user: current_user)
    @all_medications.each do |medication|
      if medication.weekdays.include?(@weekday_today)
        @medication_hour = medication.hours.strftime("%k")
        @medication_minute = medication.hours.strftime("%M")
        @supposed_taken_time = DateTime.new(Time.now.year, Time.now.month, Time.now.day, @medication_hour.to_i, @medication_minute.to_i)
        @taken_medications = TakenMedication.where(medication: medication)
        @taken_medications = @taken_medications.find { |taken_medication| taken_medication.taken_date >= @supposed_taken_time }

        if @taken_medications.nil? && DateTime.now >= @supposed_taken_time
          flash[:alert] = "Take your medication #{medication.name} at #{@supposed_taken_time}"
        end
      end
    end
  end
end
