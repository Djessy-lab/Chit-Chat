class ChildrenController < ApplicationController
  before_action :set_child, only: %i[destroy create_filiations update]

  def create
    @child = Child.new(child_params)
    @child.save
    create_filiations
    redirect_to user_path(current_user)
  end

  def destroy
    @child.destroy
    # redirect_to children_path, status: :see_other
  end

  def update
    @user = current_user
    @child.update(child_params)
    redirect_to @user
  end

  private

  def create_filiations
    @filiation = Filiation.new()
    @filiation.child = @child
    @filiation.user = current_user
    @filiation.progress = :accepted
    @filiation.save
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthdate, :photo, filiations_attributes: [:user_id])
  end
end
