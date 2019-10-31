class CriticalLearningsController < ApplicationController
  before_action :set_critical_learning, only: [:show, :edit, :update, :destroy]

  # GET /critical_learnings
  # GET /critical_learnings.json
  def index
    @critical_learnings = CriticalLearning.all
  end

  # GET /critical_learnings/1
  # GET /critical_learnings/1.json
  def show
  end

  # GET /critical_learnings/new
  def new
    @critical_learning = CriticalLearning.new
  end

  # GET /critical_learnings/1/edit
  def edit
  end

  # POST /critical_learnings
  # POST /critical_learnings.json
  def create
    @critical_learning = CriticalLearning.new(critical_learning_params)

    respond_to do |format|
      if @critical_learning.save
        format.html { redirect_to @critical_learning, notice: 'Critical learning was successfully created.' }
        format.json { render :show, status: :created, location: @critical_learning }
      else
        format.html { render :new }
        format.json { render json: @critical_learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /critical_learnings/1
  # PATCH/PUT /critical_learnings/1.json
  def update
    respond_to do |format|
      if @critical_learning.update(critical_learning_params)
        format.html { redirect_to @critical_learning, notice: 'Critical learning was successfully updated.' }
        format.json { render :show, status: :ok, location: @critical_learning }
      else
        format.html { render :edit }
        format.json { render json: @critical_learning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_learnings/1
  # DELETE /critical_learnings/1.json
  def destroy
    @critical_learning.destroy
    respond_to do |format|
      format.html { redirect_to critical_learnings_url, notice: 'Critical learning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critical_learning
      @critical_learning = CriticalLearning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def critical_learning_params
      params.require(:critical_learning).permit(:competency_id, :level_id, :description, :number, :not_reached, :partially_reached, :reached, :over_reached)
    end
end
