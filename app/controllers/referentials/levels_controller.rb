class Referentials::LevelsController < Referentials::ApplicationController
  load_and_authorize_resource :level,
                              through: :referential,
                              class: 'Referential::Level'

  # GET /levels
  # GET /levels.json
  def index
    @new_level = Referential::Level.new referential: @referential
    breadcrumb
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @competencies = @referential.competencies
    breadcrumb
  end

  # GET /levels/new
  def new
    @level.referential = @referential
    @level.number = @referential.levels.count + 1
    breadcrumb
    add_breadcrumb 'Nouveau niveau'
  end

  # GET /levels/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /levels
  # POST /levels.json
  def create
    respond_to do |format|
      if @level.save
        format.html { redirect_to referential_level_path(@referential, @level), notice: 'Level was successfully created.' }
        format.json { render :show, status: :created, location: @level }
      else
        format.html { render :new }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to referential_level_path(@referential, @level), notice: 'Level was successfully updated.' }
        format.json { render :show, status: :ok, location: @level }
      else
        format.html { render :edit }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to @referential, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Niveaux', referential_levels_path(@referential)
    add_breadcrumb @level, referential_level_path(@referential, @level) if @level && @level.persisted?
  end

  private

  def level_params
    params.require(:referential_level).permit(:number, :name, :description, :referential_id)
  end
end
