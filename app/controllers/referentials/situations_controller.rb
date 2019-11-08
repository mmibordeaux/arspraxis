class Referentials::SituationsController < ReferentialsController
  skip_load_and_authorize_resource
  load_and_authorize_resource :referential
  load_and_authorize_resource :situation,
                              through: :referential,
                              class: 'Referential::Situation'

  # GET /situations
  # GET /situations.json
  def index
    breadcrumb
  end

  # GET /situations/1
  # GET /situations/1.json
  def show
    @competency = @situation.competency
    breadcrumb
  end

  # GET /situations/new
  def new
    @competency = Referential::Competency.find params[:competency_id]
    @situation.competency = @competency
    @situation.number = @competency.situations.count + 1
    breadcrumb
    add_breadcrumb 'Nouvelle situation professionnelle'
  end

  # GET /situations/1/edit
  def edit
    @competency = @situation.competency
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /situations
  # POST /situations.json
  def create
    respond_to do |format|
      if @situation.save
        format.html { redirect_to referential_situation_path(@referential, @situation), notice: 'Situation was successfully created.' }
        format.json { render :show, status: :created, location: @situation }
      else
        format.html { render :new }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situations/1
  # PATCH/PUT /situations/1.json
  def update
    respond_to do |format|
      if @situation.update(situation_params)
        format.html { redirect_to referential_situation_path(@referential, @situation), notice: 'Situation was successfully updated.' }
        format.json { render :show, status: :ok, location: @situation }
      else
        format.html { render :edit }
        format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situations/1
  # DELETE /situations/1.json
  def destroy
    @situation.destroy
    respond_to do |format|
      format.html { redirect_to @referential, notice: 'Situation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Situations professionnelles', referential_situations_path(@referential)
    add_breadcrumb @competency, referential_competency_path(@referential, @competency) if @competency
    add_breadcrumb @situation, referential_situation_path(@referential, @situation) if @situation && @situation.persisted?
  end

  private

  def situation_params
    params.require(:referential_situation).permit(:description, :number, :competency_id)
  end
end
