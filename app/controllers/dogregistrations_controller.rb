class DogregistrationsController < ApplicationController



  def new
    @registration = Dogregistration.new
  end

  def create
    @registration = Dogregistration.new(registration_params)

    if @registration.save
      redirect_to dogregistrations_path, notice: 'Dog Successfully Registered'
    else
      render 'new'
    end
  end

  def show

  end

  def index
    @registration = Dogregistration.all
  end











  private
  def registration_params
    params.require(:dogregistration).permit(:first_name, :last_name, :email, :dog_name)
  end

end
