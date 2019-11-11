class Referentials::CompetenciesController < Referentials::ApplicationController
  load_and_authorize_resource :competency,
                              through: :referential,
                              class: 'Referential::Competency'

  # GET /competencies
  # GET /competencies.json
  def index
    @new_competency = Referential::Competency.new referential: @referential
    breadcrumb
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
    @new_resource = Referential::Resource.new referential: @referential,
                                              competency: @competency
    @new_situation = Referential::Situation.new referential: @referential
    @new_critical_learning = Referential::CriticalLearning.new  referential: @referential,
                                                                competency: @competency
    breadcrumb
  end

  # GET /competencies/new
  def new
    @referential = Referential.find params[:referential_id]
    @competency.referential = @referential
    @competency.number = @referential.competencies.count + 1
    breadcrumb
    add_breadcrumb 'Nouvelle compétence'
  end

  # GET /competencies/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /competencies
  # POST /competencies.json
  def create
    respond_to do |format|
      if @competency.save
        format.html { redirect_to referential_competency_path(@referential, @competency), notice: 'Competency was successfully created.' }
        format.json { render :show, status: :created, location: @competency }
      else
        format.html { render :new }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to referential_competency_path(@referential, @competency), notice: 'Competency was successfully updated.' }
        format.json { render :show, status: :ok, location: @competency }
      else
        format.html { render :edit }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to @referential, notice: 'Competency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Compétences', referential_competencies_path(@referential)
    add_breadcrumb @competency, referential_competency_path(@referential, @competency) if @competency && @competency.persisted?
  end

  private

  def competency_params
    params.require(:referential_competency).permit(:name, :short_name, :description, :essential_components, :number, :referential_id)
  end
end
