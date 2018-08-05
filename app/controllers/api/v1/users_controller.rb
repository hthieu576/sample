# frozen_string_literal: true

class Api::V1::UsersController < ::Api::BaseController
  include Api::V1::Swagger::UsersApi

  before_action :set_user, only: :show

  def show
    if @user
      render json: { attributes: @user, account_ids: @user.accounts.pluck(:id) }
    else
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:id)
  end

  def set_user
    @user = User.find_by(id: user_params[:id])
  end
end
