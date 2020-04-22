class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end 

    def new
        @comment = Comment.new
    end 

    def create
        @comment = Comment.create(comment_params)
        if @comment.save
            redirect_to comment_path
        else 
            render :new
    end 
    end 

    def show
        @comment.find_by(params_:id)

    end 

    private 

    def comment_params
        params.require(:comment).permit(:message, user_ids: [])
    end 
end
