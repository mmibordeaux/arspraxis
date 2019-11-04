class CriticalLearningsController < ApplicationController
  load_and_authorize_resource

  # GET /critical_learnings
  # GET /critical_learnings.json
  def index
    @critical_learnings = CriticalLearning.all
  end

  # GET /critical_learnings/1
  # GET /critical_learnings/1.json
  def show
    @competency = @critical_learning.competency
    @level = @critical_learning.level
    @referential = @competency.referential
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, @competency
    add_breadcrumb @level, @level
    add_breadcrumb @critical_learning
  end

  # GET /critical_learnings/new
  def new
    @competency = Competency.find params[:competency_id]
    @level = Level.find params[:level_id]
    @referential = @competency.referential
    @critical_learning.competency = @competency
    @critical_learning.level = @level
    @critical_learning.number = @competency.critical_learnings.with_level(@level).count + 1
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, @competency
    add_breadcrumb @level, @level
    add_breadcrumb 'Nouvel apprentissage critique'
  end

  # GET /critical_learnings/1/edit
  def edit
    @competency = @critical_learning.competency
    @level = @critical_learning.level
    @referential = @competency.referential
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, @competency
    add_breadcrumb @level, @level
    add_breadcrumb @critical_learning, @critical_learning
    add_breadcrumb 'Modifier'
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

  def critical_learning_params
    params.require(:critical_learning).permit(:competency_id, :level_id, :description, :number, :not_reached, :partially_reached, :reached, :over_reached)
  end
end