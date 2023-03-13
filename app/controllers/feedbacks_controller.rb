class FeedbacksController < ApplicationController

  def index
    @child = Child.find(params[:child_id])
    @sleep_feedback = @child.feedbacks.today.find_by(category: "sleep") || Feedback.new(category: "sleep")
    @food_feedback = @child.feedbacks.today.find_by(category: "food") || Feedback.new(category: "food")
    @diaper_feedback = @child.feedbacks.today.find_by(category: "diaper") || Feedback.new(category: "diaper")
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @child = Child.find(params[:child_id])
    @feedback.user = current_user
    @feedback.child = @child
    if @feedback.save
      redirect_to feedbacks_path(@feedback)
    else
      @sleep_feedback = @child.feedbacks.today.find_by(category: "sleep") || Feedback.new(category: "sleep")
      @food_feedback = @child.feedbacks.today.find_by(category: "food") || Feedback.new(category: "food")
      @diaper_feedback = @child.feedbacks.today.find_by(category: "diaper") || Feedback.new(category: "diaper")
      render "feedbacks/index", status: :unprocessable_entity
    end
  end

  def update
    @feedback = Feedback.find(params[:id])
    @feedback.update(feedback_params)
    redirect_to feedbacks_path(@feedback)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content, :rating, :category)
  end
end
