class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def feedbacks
    @children = current_user.accepted_children
  end

  def papers
    @children = current_user.accepted_children
  end
end
