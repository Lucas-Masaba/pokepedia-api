class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy, :update]

  # Get /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # Get /users/{username}
  def show
    render json: @user, status: :ok
  end

  # Post /users
  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user,  status: :created
    else
      render json: { errors: @user.errors.full_messages }, 
      status: :unprocessable_entity
    end
  end

  # Put /users/{username}
  def update
    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessible_entity
  end
  
  # Delete /users/{username}
  def destroy
    @user.destroy
  end

  private
    def user_params
      params.permit(:name, :username, :email, :password, :role)
    end
  
    def set_user
      @user = User.find(params[:id])
    end
end

