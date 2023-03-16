class PapersController < ApplicationController
  before_action :set_papers, only: %i[show destroy]

  def index
    @child = Child.find(params[:child_id])
    @papers = @child.papers.order(created_at: :desc)
  end

  def show
  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(papers_params)
    @paper.user = current_user
    if @paper.save
      redirect_to papers_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @paper.destroy
    redirect_to papers_path
  end

  private

  def set_papers
    @paper = Paper.find(params[:id])
  end

  def papers_params
    params.require(:paper).permit(:name, :photo, :child_id)
  end
end
