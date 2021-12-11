class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_login, only: [:show, :update]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    if current_user_id != @user.id
      json = {error: 'Unauthorized'}
      status = :unauthorized
    else
      json = @user
      status = :ok
    end
    render json: json, status: status
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    user = User.find_by("lower(email) = ?", user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      render json: { token: token(user.id), user_id: user.id }, status: :created 
    else 
      render json: { errors: [ "Sorry, incorrect username or password" ] }, status: :unprocessable_entity
    end 
  end

  def regions
    render json: Region.all, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :region_id)
    end
end
