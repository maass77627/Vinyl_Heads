class RecordsController < ApplicationController

    def index
        @records = Record.all
        @records = Record.search(params[:search])
    end
    
    
    def new
        @record = Record.new
    end


    def create
        @record = Record.create(record_params)
        #@record.user = current_user
        if @record.save
            #binding.pry
            redirect_to record_path(@record)
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
    end

    private
    def record_params
        params.require(:record).permit(:title, :artist, :genre, :search, post_attributes: [:name])
    end
    
end
