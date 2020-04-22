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
       # binding.pry
        if @record.save
            redirect_to record_path(@record)
        end
    end
    
    def show
        @record = Record.find_by(params[:id])
    end

    private
    def record_params
        params.require(:record).permit(:title, :post_id, post_attributes: [:name, :contents], genre_attributes: [:name])
    end

end
