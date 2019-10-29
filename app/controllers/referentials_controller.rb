class ReferentialsController < ApplicationController
  before_action :set_referential, only: [:show, :edit, :update, :destroy]

  # GET /referentials
  # GET /referentials.json
  def index
    @referentials = Referential.all
  end

  # GET /referentials/1
  # GET /referentials/1.json
  def show
  end

  # GET /referentials/new
  def new
    @referential = Referential.new
  end

  # GET /referentials/1/edit
  def edit
  end

  # POST /referentials
  # POST /referentials.json
  def create
    @referential = Referential.new(referential_params)

    respond_to do |format|
      if @referential.save
        format.html { redirect_to @referential, notice: 'Referential was successfully created.' }
        format.json { render :show, status: :created, location: @referential }
      else
        format.html { render :new }
        format.json { render json: @referential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referentials/1
  # PATCH/PUT /referentials/1.json
  def update
    respond_to do |format|
      if @referential.update(referential_params)
        format.html { redirect_to @referential, notice: 'Referential was successfully updated.' }
        format.json { render :show, status: :ok, location: @referential }
      else
        format.html { render :edit }
        format.json { render json: @referential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referentials/1
  # DELETE /referentials/1.json
  def destroy
    @referential.destroy
    respond_to do |format|
      format.html { redirect_to referentials_url, notice: 'Referential was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referential
      @referential = Referential.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referential_params
      params.require(:referential).permit(:name, :origin)
    end
end
