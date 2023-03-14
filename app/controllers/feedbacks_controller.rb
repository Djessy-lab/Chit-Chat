class FeedbacksController < ApplicationController

  def index
    @child = Child.find(params[:child_id])
    @sleep_feedback = @child.feedbacks.today.find_by(category: "sleep") || Feedback.new(category: "sleep")
    @food_feedback = @child.feedbacks.today.find_by(category: "food") || Feedback.new(category: "food")
    @diaper_feedback = @child.feedbacks.today.find_by(category: "diaper") || Feedback.new(category: "diaper")
  end

  def parent_index
    @date = Date.parse(params[:date])
    @child = Child.find(params[:child_id])
    @sleep_feedback = @child.feedbacks.where("DATE(created_at) = ?", @date).find_by(category: "sleep")
    @food_feedback = @child.feedbacks.where("DATE(created_at) = ?", @date).find_by(category: "food")
    @diaper_feedback = @child.feedbacks.where("DATE(created_at) = ?", @date).find_by(category: "diaper")
    render :parent_index, layout: false
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @child = Child.find(params[:child_id])
    @feedback.user = current_user
    @feedback.child = @child
    if @feedback.save
      @sleep_feedback = @child.feedbacks.today.find_by(category: "sleep") || Feedback.new(category: "sleep")
      @food_feedback = @child.feedbacks.today.find_by(category: "food") || Feedback.new(category: "food")
      @diaper_feedback = @child.feedbacks.today.find_by(category: "diaper") || Feedback.new(category: "diaper")
      respond_to do |format|
        format.html { redirect_to feedbacks_path }
        format.turbo_stream
      end
    else
      render "feedbacks/index", status: :unprocessable_entity
    end
  end

  def update
    @feedback = Feedback.find(params[:id])
    @child = @feedback.child
    if @feedback.update(feedback_params)
      @sleep_feedback = @child.feedbacks.today.find_by(category: "sleep") || Feedback.new(category: "sleep")
      @food_feedback = @child.feedbacks.today.find_by(category: "food") || Feedback.new(category: "food")
      @diaper_feedback = @child.feedbacks.today.find_by(category: "diaper") || Feedback.new(category: "diaper")
    else
      render "feedbacks/index", status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content, :rating, :category)
  end
end
