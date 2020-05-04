class PostsController < ApplicationController
  
      def index
        @artists = Artist.all
        if !params[:artist].blank?
          @posts = Post.by_artist(params[:artist])
        else 
          @posts = Post.all
        end
      end

    def new
        @post = Post.new
        @post.user = current_user
        @record = @post.build_record(title: "title",
        id: :id)
        @artist = @post.build_artist(name: "name",
        id: :id)
        @genres = @post.genres.build([
        { name: "test", id: [] }])
    end
        
 
    def create
          @post = Post.create(post_params)
          @post.user = current_user
          @post.image.attach(params[:post][:image])
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
        binding.pry
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to users_path(@user)
    end 

    private
    
    def post_params
      params.require(:post).permit(:name, :contents, :image, :user_id, category_ids: [], genres_attributes: [:name, :id], artist_attributes: [:name, :id], record_attributes: [:title, :id])
      
    end
end
