class CommentsController < ApplicationController

     def index
        @comments = Comment.all
     end 

      def new
        @comment = Comment.new
      end
    
      def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to @comment.post
        else
          flash[:notice] = "Fields Cannot be Blank"
          redirect_to posts_path
        end
      end

      def destroy

      end 
    private
    
    def comment_params
        params.require(:comment).permit(:message, :user_id, :post_id, user_attributes:[:username])
      end
    
    end
   
  
    