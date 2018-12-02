class ResidentsController < ApplicationController
  def index
    @condo = Condo.find(params[:id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @residents = @apartment.users

    render json: @residents
  end

  def show
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @resident = @apartment.users.find(params[:resident_id])

    render json: @resident
  end

  def create
    @condo = Condo.find(params[:id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    @resident = @apartment.user.create(resident_params)

    if @resident.save
      render json: @resident, status: :created, location: @resident
    else
      render json: @resident.errors, status: :unprocessable_entity
    end
  end

  def update
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @resident = @apartment.users.find(params[:resident_id])

    if @resident.update(apartment_params)
      render json: @resident
    else
      render json: @resident.errors, status: :unprocessable_entity
    end
  end

  def delete
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @resident = @apartment.users.find(params[:resident_id])

    @resident.destroy
  end
  private

  def apartment_params
    params.require(:resident).permit(:name, :email, :phone)
  end
end
