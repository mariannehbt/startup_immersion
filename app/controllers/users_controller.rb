class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :is_right_user?, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :situation_id, :formation, :activity_id, :description, :linked_in_url, :newsletter_id)
    end

    def is_right_user?
      @user = User.find(params[:id])
      unless @user.id == current_user.id
        flash[:danger] = "This is not your account"
        redirect_to user_path(current_user)
      end
    end
end
