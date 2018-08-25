class CoffeeStatusesController < ApplicationController
  before_action :set_coffee_status, only: [:show, :edit, :update, :destroy]
  require 'pry'
  # GET /coffee_statuses
  # GET /coffee_statuses.json
  def index
    @coffee_statuses = CoffeeStatus.all.order("last_updated DESC")
  end

  # GET /coffee_statuses/1
  # GET /coffee_statuses/1.json
  def show
  	@coffee_status = CoffeeStatus.find(params[:id])
  end

  # GET /coffee_statuses/new
  def new
    @coffee_status = CoffeeStatus.new
  end

  # GET /coffee_statuses/1/edit
  def edit
  end

  # POST /coffee_statuses
  # POST /coffee_statuses.json
  def create
    @coffee_status = CoffeeStatus.new(coffee_status_params)
    @coffee_status[:last_updated] = Time.now()
    respond_to do |format|
      if @coffee_status.save
        format.html { redirect_to coffee_statuses_path, notice: 'Coffee status was successfully created.' }
        format.json { render :show, status: :created, location: @coffee_status }
      else
        format.html { render :new }
        format.json { render json: @coffee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_statuses/1
  # PATCH/PUT /coffee_statuses/1.json
  def update
    respond_to do |format|
    	binding.pry
    	@coffee_status[:last_updated] = Time.now()
      if @coffee_status.update(coffee_status_params)
        format.html { redirect_to coffee_statuses_path, notice: 'Coffee status was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffee_status }
      else
        format.html { render :edit }
        format.json { render json: @coffee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_statuses/1
  # DELETE /coffee_statuses/1.json
  def destroy
    @coffee_status.destroy
    respond_to do |format|
      format.html { redirect_to coffee_statuses_url, notice: 'Coffee status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_status
      @coffee_status = CoffeeStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_status_params
      params.require(:coffee_status).permit(:available, :user_updated_last, :last_updated)
    end
end
