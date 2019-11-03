class LevelsController < ApplicationController
  load_and_authorize_resource

  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @competencies = @level.referential.competencies
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @level.referential, @level.referential
    add_breadcrumb @level
  end

  # GET /levels/new
  def new
    @referential = Referential.find params[:referential_id]
    @level.referential = @referential
    @level.number = @referential.levels.length + 1
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @referential, @referential
    add_breadcrumb 'Nouveau niveau'
  end

  # GET /levels/1/edit
  def edit
    add_breadcrumb 'Référentiels', :referentials_path
    add_breadcrumb @level.referential, @level.referential
    add_breadcrumb @level, @level
    add_breadcrumb 'Modifier'
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
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
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
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
      format.html { redirect_to levels_url, notice: 'Level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def level_params
    params.require(:level).permit(:number, :name, :referential_id)
  end
end
