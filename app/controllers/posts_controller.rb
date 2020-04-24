class PostsController < ApplicationController

    def index
       # @current_user = current_user
        @posts = Post.all
       # @posts.each do |post|
       #post.record = Record.new(title: :title)   
   # end
   #binding.pry
    end 

    def new
        @post = Post.new
        @comment = Comment.new(post_id: params[:post_id])
       # @post.build_record(title: params[:title], post_id: params[:post_id])
        @post.record = Record.new(title: :title)
    end

    def create
        @post = Post.create(post_params)
         @post.user = current_user
         @post.image.attach(params[:post][:image]) #record
        if @post.save
            redirect_to post_path(@post)
        else 
            render :new 
        end
    end

    def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
          redirect_to @post
        else
          render 'edit'
        end
      end
        
    def show
        @post = Post.find(params[:id])
        #binding.pry
    end
    
    def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    redirect_to new_post_path
    end 

    private
    
    def post_params
        params.require(:post).permit(:name, :contents, image: [], record_attributes: [:title], user_ids: [])
    end
end
