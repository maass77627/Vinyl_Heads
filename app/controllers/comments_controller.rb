class CommentsController < ApplicationController



    def index
        @comments = Comment.all
    
    end 


    def new
        @comment = Comment.new
      end
    
      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          redirect_to posts_path#(@comment.post)
        else
          flash[:notice] = "Fields Cannot be Blank"
          redirect_to post_path#(@comment.post)
        end
      end

      def edit
        @comment = Comment.find(params[:id])
      end 

      def update
      end 

      def destroy

      end 
    
    
    
      private
    
    
      def comment_params
        params.require(:comment).permit(:message, :user_id, :post_id)
      end
    
    end
   
  
    