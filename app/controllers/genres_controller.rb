class GenresController < ApplicationController

    def index
        @genres = Genre.all

    end 

    def new
        @genre = Genre.new

    end 

    def create
        @genre = Genre.create(params_genre)
        if @genre.save
            redirect_to genre_path

    end 

    def show
        @genre = Genre.find(params_:id)

    end
    private 

    def genre_params
            params.require(:genre).permit(:message, post_ids: [])
        end

    
end
