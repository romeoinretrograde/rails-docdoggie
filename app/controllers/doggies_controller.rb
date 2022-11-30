class DoggiesController < ApplicationController

  def new
    @doggie = Doggie.new
  end


  def create
    @doggie = Doggie.new(params[:doggie_params])
    @doggie.user = current_user
    
    if @doggie.save
      redirect_to dashboard_path, status: :see_other
    else
      render new_doggie_path, status: :unprocessable_entity
    end

  end

  private

  def doggie_params
    params.require(:doggie).permit(:petname)
  end
end
