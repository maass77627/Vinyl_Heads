class GenresController < ApplicationController

    def index
        @genres = Genre.all
     end 

    def new
        @genre = Genre.new(name: :name)
    end 

    def create
          @genre = Genre.new(genre_params)
        if @genre.save
          redirect_to genre_path(@genre)
        end 
    end 

    def show
        @genre = Genre.find(params_:id)
    end
    
    private 

    def genre_params
            params.require(:genre).permit(:name, :id)
    end

    
end
