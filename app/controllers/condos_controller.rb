class CondosController < ApplicationController
  def index
    @condos = Condo.all

    render json: @condos
  end

  def show
    @condo = Condo.find(params[:id])

    render json: @condo
  end

  def create
    @condo = Condo.create(condo_params)

    if @condo.save
      render json: @condo, status: :created, location: @condo
    else
      render json: @condo.errors, status: :unprocessable_entity
    end
  end

  private

    def condo_params
      params.permit(:name, :address)
    end
end
