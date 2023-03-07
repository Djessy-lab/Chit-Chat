class FialiationsController < ApplicationController

  def create
    @filiation = Filiation.new(filiations_params)
    @child = Child.find(params[:child_id])
    @filiation.child = @child
    @user = User.find(params[:user_id])
    @filiation.user = @user
    @filiation.save
  end

  def update
    @filiation.update(filiations_params)
    redirect_to posts_path
  end

  private

  def set_filiations
    @filiation = Filiation.find(params[:id])
  end

  def filiations_params
    params.require(:filiation).permit(:progress, :child_id, :user_id)
  end
end
