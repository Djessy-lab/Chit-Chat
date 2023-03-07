class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # if @user.family?
    #   # action children#new
    #   @child = Child.new
    #   # action filitations#new
    #   @filiation = Filiation.new
    #   # action filiations#edit
    #   @filiation.edit
    # elsif @user.nanny?
    #   @filiation.edit
    # end
  end
end
