class RecordsController < ApplicationController

    def index
        @records = Record.all
    end
    
    
    def new
        @record = Record.new
    end

    def create
        @record = Record.create(record_params)
        if @record.save
            redirect_to record_path
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
    end

    private
    def record_params
        params.require(:record).permit(:name, :artist, :genre)
    end

end
