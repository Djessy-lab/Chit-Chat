class ChildrenController < ApplicationController
  before_action :set_child, only: %i[destroy create_filiations]

  def create
    @child = Child.new(child_params)
    @child.save
    create_filiations
  end

  def destroy
    @child.destroy
    # redirect_to children_path, status: :see_other
  end

  private

  def create_filiations
    @filiation = Filiation.new(filiations_params)
    @filiation.child = @child
    @user = User.find(params[:user_id])
    @filiation.user = @user
    @filiation.save
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthdate, :avatar)
  end
end
