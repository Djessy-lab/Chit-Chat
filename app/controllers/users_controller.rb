class UsersController < ApplicationController
  # def index
  #   if params[:query].present?
  #     @users = User.where(first_name: params[:query])
  #   else
  #     @users = User.all
  #   end
  # end

  def show
    @user = User.find(params[:id])
    if @user.family?
      # action children#new
      @child = Child.new
      # @child.family_filiations.build([{},{}])
      @child.family_filiations.build
      @child.build_nanny_filiation
      # action filitations#new
      # @filiation = Filiation.new
      # action filiations#edit
    end
    edit_filiation
  end

  def edit_filiation
    @filiations = current_user.filiations.where(progress: :pending)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:role, :first_name, :last_name, :bio, :photo)
  end
end
