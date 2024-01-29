class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]

  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:full_name, :email, :mobile,
        :dob, :gender, :password, :password_confirmation) rescue []
    end
  
end
