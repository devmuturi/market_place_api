class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: {}, status: :no_content
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.expect(user: [ :email, :password ])
  end
  def set_user
    @user = User.find(params[:id])
  end
end
