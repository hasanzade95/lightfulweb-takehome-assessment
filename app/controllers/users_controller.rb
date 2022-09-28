class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:firstname, :lastname, :birthdate, :url))

    if @user.save
      redirect_to root_path, notice: "Saved successfully..."
    else
      render :index, status: :unprocessable_entity
    end
  end
end
