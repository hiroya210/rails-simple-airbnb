class FlatsController < ApplicationController

    before_action :find_flats, only: [:show, :edit, :update, :destroy]

    def index
      @flats = Flat.all
    end

    def show
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
      @flats.destroy
    end

  private

    def flats_params
      params.required(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guest)
    end


    def find_flats
      @flat = Flat.find(params[:id])
    end
end
