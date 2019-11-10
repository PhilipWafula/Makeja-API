# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  skip_before_action :doorkeeper_authorize!, except: %i[update destroy]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, location: [:api, :v1, user]
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok, location: [:api, :v1, @user]
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,
                                 :full_name,
                                 :password,
                                 :password_confirmation,
                                 :phone,
                                 :role,
                                 :state,
                                 :status)
  end
end