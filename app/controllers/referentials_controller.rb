class ReferentialsController < ApplicationController
  load_and_authorize_resource

  # GET /referentials
  # GET /referentials.json
  def index
    @new_referential = Referential.new
    breadcrumb
  end

  # GET /referentials/1
  # GET /referentials/1.json
  def show
    @new_level = Referential::Level.new referential: @referential
    @new_manager = Referential::Manager.new referential: @referential
    @new_competency = Referential::Competency.new referential: @referential
    breadcrumb
  end

  def visualize
    breadcrumb
    add_breadcrumb 'Visualisation'
  end

  # GET /referentials/new
  def new
    breadcrumb
    add_breadcrumb 'Nouveau référentiel'
  end

  # GET /referentials/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
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

  protected

  def breadcrumb
    super
    add_breadcrumb 'Référentiels', referentials_path
    add_breadcrumb @referential, @referential if @referential && @referential.persisted?
  end

  private

  def referential_params
    params.require(:referential).permit(:name, :origin, :description, :image)
  end
end
