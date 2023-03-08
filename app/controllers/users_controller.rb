class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.family?
      # action children#new
      @child = Child.new
      # action filitations#new
      @filiation = Filiation.new
      # action filiations#edit
    end
    edit_filiation
  end

  def edit_filiation
    @filiations = current_user.filiations.where(progress: :pending)

  end

  # def filiations_params
  #   params.require(:filiation).permit(:child_id, :user_id, :progress)
  # end

end
