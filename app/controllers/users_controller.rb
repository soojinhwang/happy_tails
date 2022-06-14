class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update]

  def show
  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.save!
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit( :email, :password, :first_name, :last_name, :age, :biography, :type_of_dwelling, :outdoor_space, :other_pets, :children, :hours_alone, :previous_experience )
  end
end
