class UsersController < ApplicationController
  before_action :set_user, only: :mypage

  def edit
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to root_path
    else
      render :edit
    end
  end

  def mypage
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :avatar, :introduction, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :height, :body_weight, :foot_size, address_attributes: [:postal_code, :prefecture, :city, :address, :apartment, :phone_number], credit_card_attributes: [:card_company, :card_number, :card_year, :card_month, :card_pass])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
