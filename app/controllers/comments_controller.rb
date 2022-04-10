class CommentsController < ApplicationController

    def new
        @comment = current_user.comments.build
    end
    
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post)
    end
    
    def edit
        @comment = Comment.find(params[:id])        
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.destroy(comment_params)
        redirect_to post_path(@post)
    
        redirect_to @post, status: :see_other
    end
    
    private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
