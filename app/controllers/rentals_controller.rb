class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource

  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end
  
  def priv_r_index
    @rentals = current_user.rentals
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.user_id = current_user.id
    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1 
  # PATCH/PUT /rentals/1.json 
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only ckd allow the white list through.
    def rental_params
      params.require(:rental).permit(:image, :r_title, :r_description, :r_num_occupants, :r_address, :r_state, :r_city, :r_zip)
    end
end
