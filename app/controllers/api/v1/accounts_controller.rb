# frozen_string_literal: true

class Api::V1::AccountsController < ::Api::BaseController
  include Api::V1::Swagger::AccountsApi

  before_action :set_user, only: :index
  before_action :set_account, only: :show

  def index
    if @user
      render json: { attributes: @user.accounts }
    else
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  def show
    if @account
      render json: { attributes: @account }
    else
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  private

  def account_params
    params.permit(:id, :user_id)
  end

  def set_user
    @user = User.find_by(id: account_params[:user_id])
  end

  def set_account
    @account = Account.find_by(id: account_params[:id])
  end
end
