class GenresController < ApplicationController

    def index
        @genres = Genre.all
     end 

    def new
        @genre = Genre.find(params[:id])#new(name: :name)
    end 

    def create
          @genre = Genre.new(genre_params)
        if @genre.save
          redirect_to genre_path(@genre)
        end 
    end 

    def show
        binding.pry
        @genre = Genre.find(params[:id])
    end
    
    private 

    def genre_params
            params.require(:genre).permit(:name, :id)
    end

    
end
