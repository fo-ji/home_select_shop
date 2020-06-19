class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :avatar, :introduction, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :height, :body_weight, :foot_size, address_attributes: [:postal_code, :prefecture, :city, :address, :apartment, :phone_number], credit_card_attributes: [:card_company, :card_number, :card_year, :card_month, :card_pass])
  end
end
