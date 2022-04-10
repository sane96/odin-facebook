class LikesController < ApplicationController
  
    def create
      debugger
      
      @like = @post.likes.build
      @like.user = current_user
      @like.save!
      redirect_to :back
    end

    def destroy
      @like = @post.likes.where(user: current_user) 
      @like.destroy!
      redirect_to :back
    end
end
