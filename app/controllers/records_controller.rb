class RecordsController < ApplicationController

    def index
        @records = Record.all
        @records = Record.search(params[:search])
    end
    
    
    def new
        @record = Record.new
        #@record.build_post(name: params[:name], contents: params[:contents])
        @record.post = Post.new(name: :name, contents: :contents)
    end


    def create
        @record = Record.create(record_params)
<<<<<<< HEAD
       # binding.pry
        if @record.save
=======
        #@record.user = current_user
        if @record.save
            #binding.pry
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
            redirect_to record_path(@record)
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
        binding.pry
    end

    def destroy
        @record = Record.find(params[:id])
        @record.destroy
      
        redirect_to records_path
      end

    private
    def record_params
<<<<<<< HEAD
        params.require(:record).permit(:title, :post_id, post_attributes: [:name, :contents], genre_attributes: [:name])
=======
        params.require(:record).permit(:title, :artist, :genre, :search, post_attributes: [:name])
>>>>>>> 792ee71d4d5f803d990291607a895611529ecb45
    end
    
end
