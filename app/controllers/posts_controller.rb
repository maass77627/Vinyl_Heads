class PostsController < ApplicationController

    def index
        @current_user = current_user
        @posts = Post.all
        end 
       

    def new
      if current_user    #change
        @post = Post.new
        @post.user = current_user #change inserted 
        @post.user.id = current_user.id
        new_record = @post.build_record(title: :title)
       
       @post.record = Record.new(title: :title)
       @post.record.user = current_user
       @post.record.save
    end
  end #change
    def create
        @post = Post.create(post_params)
       # binding.pry
         @post.user = current_user
         @post.image.attach(params[:post][:image]) #record
         if @post.save && @post.image.attached?
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
      params.require(:post).permit(:name, :contents, :image, record_attributes: [:title, :user_id], genre_ids: [], genres_attributes: [:name]) #genrechangetook out user id
    end
end
