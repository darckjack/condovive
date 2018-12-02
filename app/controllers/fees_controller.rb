class FeesController < ApplicationController
  def create
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    @fee = @apartment.fees.create(fee_params, date: DateTime.now >> 1, paid: false)

    if @fee.save
      render json: @fee, status: :created, location: @fee
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  def pay
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @fee = @apartment.fees.find(params[:fee_id])

    if @fee.update(paid: true)
      render json: @fee
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  def unpaid
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @fees = @apartment.fees.where(paid: false)

    render json: @fees
  end

  def paid
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @fees = @apartment.fees.where(paid: true)

    render json: @fees
  end
end
