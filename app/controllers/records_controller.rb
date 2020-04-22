class RecordsController < ApplicationController

    def index
        @records = Record.all
    end
    
    
    def new
        @record = Record.new
        @record.build_post(name: params[:name], contents: params[:contents])
    end

    def create
        @record = Record.create(record_params)
        if @record.save
            redirect_to record_path(@record)
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
    end

    private
    def record_params
        params.require(:record).permit(:name, post_attributes: [:name, :contents], post_ids: [])
    end

end
