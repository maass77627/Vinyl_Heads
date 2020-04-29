class ArtistsController < ApplicationController
    def posts_index
        @artist = Artist.find(params[:id])
        @posts = @artist.posts##
        render template: 'posts/index'
      end
     
      def post
        @artist = Artist.find(params[:id])
        @post = Post.find(params[:post_id])##
        render template: 'posts/show'
      end
    def new
        @artist = Artist.new 
    end 
    
      def show 
        @artist = Artist.find(params[:id])
      end 
end
