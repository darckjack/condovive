class FeesController < ApplicationController
  skip_before_action :authorize_user, only: :pay
  before_action :authorize, only: :pay
  
  def create
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])

    @fee = @apartment.fees.create(fee_params)

    @fee.date = DateTime.now >> 1
    @fee.paid = false

    if @fee.save
      render json: @fee, status: :created
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  def pay
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @fee = @apartment.fees.find(params[:fee_id])

    if @fee.update(paid: true, user: current_user)
      render json: @fee
    else
      render json: @fee.errors, status: :unprocessable_entity
    end
  end

  def show
    @condo = Condo.find(params[:condo_id])
    @apartment = @condo.apartments.find(params[:apartment_id])
    @fee = @apartment.fees.find(params[:fee_id])

    render json: @fee
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

  private

    def fee_params
      params.permit(:amount)
    end

    def authorize
      render json: { error: 'Not Authorized' }, status: 401 unless current_user.resident?
    end
end
