class FlatsController < ApplicationController

    before_action :find_flats, only: [:show, :edit, :update, :destroy]

    def home
    end

    def index
      @flats = Flat.all
      unless params[:search_flats] == ""
        @flats = @flats.where("name like ?","%#{params[:search_flats]}%")
      else
        @flats = Flat.all
      end
    end

    def show
      @image = "../../assets/#{@flat.image}"
      @lorem = "https://loremflickr.com/320/240/house" 
    end

    def new
      @flat = Flat.new
    end

    def create
      @flat = Flat.new(flats_params)
      if @flat.save
        redirect_to flat_path(@flat)
      else
        render :new
      end
    end

    def edit
    end

    def update
      @flat.update(flats_params)

      redirect_to flat_path(@flat)
    end

    def destroy
      @flat.destroy

      redirect_to flats_path
    end

  private

    def flats_params
      params.required(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest, :image)
    end


    def find_flats
      @flat = Flat.find(params[:id])
    end
end
