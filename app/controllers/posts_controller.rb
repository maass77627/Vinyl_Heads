class PostsController < ApplicationController

    def index
        @current_user = current_user
        @posts = Post.all
    end

    def new
        @post = Post.new
        @post.build_record(title: 'album')
        
    end

    def create
        @post = Post.create(post_params)
         @post.user = current_user
         @post.record.image.attach(params[:post][:image])
        if @post.save
            redirect_to post_path(@post)
        else 
            render :new 
        end
    end
        
    def show
        @post = Post.find(params[:id])
        end

    private
    
    def post_params
        params.require(:post).permit(:name, :contents, record_attributes: [:title], user_ids: [])
    end
end
