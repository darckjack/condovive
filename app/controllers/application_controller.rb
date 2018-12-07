class ApplicationController < ActionController::API
  before_action :authenticate_request, :authorize_user
  attr_reader :current_user

  include ExceptionHandler

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def authorize_user
    render json: { error: 'Not Authorized' }, status: 401 unless current_user.admin?
  end
end
