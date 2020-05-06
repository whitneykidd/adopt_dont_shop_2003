class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    @shelter = Shelter.new
    @shelter.name = params[:name]
    @shelter.address = params[:address]
    @shelter.city = params[:city]
    @shelter.state = params[:state]
    @shelter.zip = params[:zip]
    @shelter.save
    
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update(shelter_params)

    redirect_to "/shelters/#{@shelter.id}"
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
