class PostsController < ApplicationController
  
      def index
      if params[:genre_id]
        @genre = Genre.find_by(id: params[:genre_id])
          if @genre.posts.empty?
            flash[:alert] = "This genre has no posts. Please add one below."
            redirect_to new_genre_post_path(@genre)
          else
            @posts = @genre.posts
          end
      else
        @posts = Post.all
      end
    end

    def new
         @post = Post.new
         @post.user = current_user 
         @post.user.id = current_user.id 
         new_record = @post.build_record(title: :title)
        @post.record = Record.new(title: :title)
         @post.genre = Genre.new(name: :name)
        @post.record.user = current_user 
        @post.save
        end
 
    def create
          @post = Post.create(post_params)
          new_genre = @post.build_genre(name: "new")
          new_genre.save
          new_artist = @post.build_artist(name: "new")
          new_artist.save
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
    end
    
    def destroy
     @post = Post.find(params[:id])
     @post.destroy
      redirect_to users_path(@user)
    end 

    private
    
    def post_params
      params.require(:post).permit(:name, :contents, :image, :genre_name, :artist_name, record_attributes: [:title])
    end
end
