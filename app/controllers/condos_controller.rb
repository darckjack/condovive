class CondosController < ApplicationController
  def index
    @condos = Condo.all

    render json: @condos
  end

  def show
    @condo = Condo.find(params[:id])

    render json: @condo
  end
end
