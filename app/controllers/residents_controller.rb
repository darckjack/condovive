class ResidentsController < ApplicationController
  skip_before_action :authorize_user, only: %i[show update]
  before_action :authorize, only: %i[show update]

  def index
    @condo = Condo.find(params[:condo_id])
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

    @resident = @apartment.users.create(resident_params)

    if @resident.save
      render json: @resident, status: :created
    else
      render json: @resident.errors, status: :unprocessable_entity
    end
  end

  def update
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @resident = @apartment.users.find(params[:resident_id])

    if @resident.update(resident_params)
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

  def resident_params
    params.permit(:name, :email, :phone, :password)
  end

  def authorize
    render json: { error: 'Not Authorized' }, status: 401 unless authorized
  end

  def authorized
     current_user.admin? || current_user == User.find(params[:resident_id])
  end
end
