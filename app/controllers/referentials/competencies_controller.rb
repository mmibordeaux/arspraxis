class Referentials::CompetenciesController < ReferentialsController
  skip_load_and_authorize_resource
  load_and_authorize_resource :referential
  load_and_authorize_resource :competency,
                              through: :referential,
                              class: 'Referential::Competency'

  # GET /competencies
  # GET /competencies.json
  def index
    add_breadcrumb 'Compétences', referential_competencies_path(@referential)
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency
  end

  # GET /competencies/new
  def new
    @referential = Referential.find params[:referential_id]
    @competency.referential = @referential
    @competency.number = @referential.competencies.length + 1
    add_breadcrumb @referential, @referential
    add_breadcrumb 'Nouvelle compétence'
  end

  # GET /competencies/1/edit
  def edit
    add_breadcrumb @competency.referential, @competency.referential
    add_breadcrumb @competency.short_name, @competency
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

  private

  def competency_params
    params.require(:referential_competency).permit(:name, :short_name, :description, :essential_components, :number, :referential_id)
  end
end
