class RecordsController < ApplicationController

    def index
        @records = Record.all
    end
    
    def new
        @record = Record.new
    end

    def create
        @record = Record.create(record_params)
       #@record.user = current_user
        if @record.save
            redirect_to record_path(@record)
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
    end


    private
    def record_params
        params.require(:record).permit(:title) #:post_id, :genre, :image, post_attributes: [:name, :contents])
    end
    
end
