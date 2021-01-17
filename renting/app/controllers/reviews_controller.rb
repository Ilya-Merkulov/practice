class ReviewsController < ApplicationController

  def create
      @review = @commet.comments.new comment_params
      @review.save
   end

   private
   def comment_params
      params.require(:review).permit(:text).merge(user_id: current_user.id)
   end

end
