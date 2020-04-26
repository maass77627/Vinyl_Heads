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
        #@comment.post = 
        if @comment.save
          redirect_to comment.post
        else
          flash[:notice] = "Fields Cannot be Blank"
          redirect_to posts_path
        end
      end

      def destroy

      end 
    
      #When creating new comments, we should only create a new user if they filled in that input. accepts_nested_attributes_for has a reject_if option that you can
       #configure to only create new records if all the fields aren't blank.
    private
    
    
      def comment_params
        params.require(:comment).permit(:message, :user_id, :post_id, user_attributes:[:username])
      end
    
    end
   
  
    