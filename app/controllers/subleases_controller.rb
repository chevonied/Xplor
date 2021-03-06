class SubleasesController < ApplicationController
  before_action :set_sublease, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource

  # GET /subleases
  # GET /subleases.json
  def index
    @subleases = Sublease.all
  end
  
  def priv_s_index
    @subleases = current_user.subleases
  end

  # GET /subleases/1
  # GET /subleases/1.json
  def show
  end

  # GET /subleases/new
  def new
    @sublease = Sublease.new
  end

  # GET /subleases/1/edit
  def edit
  end

  # POST /subleases
  # POST /subleases.json
  def create
    @sublease = Sublease.new(sublease_params)
    @sublease.user = current_user
    @sublease.user_id = current_user.id
    respond_to do |format|
      if @sublease.save
        format.html { redirect_to @sublease, notice: 'Sublease was successfully created.' }
        format.json { render :show, status: :created, location: @sublease }
      else
        format.html { render :new }
        format.json { render json: @sublease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subleases/1
  # PATCH/PUT /subleases/1.json
  def update
    respond_to do |format|
      if @sublease.update(sublease_params)
        format.html { redirect_to @sublease, notice: 'Sublease was successfully updated.' }
        format.json { render :show, status: :ok, location: @sublease }
      else
        format.html { render :edit }
        format.json { render json: @sublease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subleases/1
  # DELETE /subleases/1.json
  def destroy
    @sublease.destroy
    respond_to do |format|
      format.html { redirect_to subleases_url, notice: 'Sublease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublease
      @sublease = Sublease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sublease_params
      params.require(:sublease).permit(:image, :s_title, :s_description, :s_num_occupants, :s_address, :s_state, :s_city, :s_zip)
    end
end
