class ChildrenController < ApplicationController
  before_action :set_child, only: %i[destroy]

  def create
    @child = Child.new(child_params)
    @child.save
  end

  def destroy
    @child.destroy
    redirect_to children_path, status: :see_other
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthdate, :avatar)
  end
end
