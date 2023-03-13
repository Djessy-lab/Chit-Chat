class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def feedbacks
    @children = current_user.children
  end
end
