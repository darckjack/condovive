class ApartmentsController < ApplicationController
  def index
    @condo = Condo.find(params[:id])
    @apartments = @condo.apartments

    render json: @apartments
  end

  def show
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    render json: @apartment
  end

  def create
    @condo = Condo.find(params[:id])

    @apartment = @condo.apartments.create(apartment_params)

    if @apartment.save
      render json: @apartment, status: :created
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def update
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    if @apartment.update(apartment_params)
      render json: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def delete
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    @apartment.destroy
    render json: {}, status: :no_content
  end
  private

    def apartment_params
      params.permit(:name, :apartment_number)
    end
end
