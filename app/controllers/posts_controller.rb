class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @post.records.build(title: 'album')
        @post.records.build(title: 'new')
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to post_path
        end
    end
        
    def show
        @post = Post.find_by(name: :name)
    end

    private
    
    def post_params
        params.require(:post).permit(:name, :contents, records_attributes: [:title])
    end
end
