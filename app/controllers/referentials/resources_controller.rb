class Referentials::ResourcesController < ReferentialsController
  skip_load_and_authorize_resource
  load_and_authorize_resource :referential
  load_and_authorize_resource :resource,
                              through: :referential,
                              class: 'Referential::Resource'

  # GET /resources
  # GET /resources.json
  def index
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @competency = @resource.competency
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, referential_competency_path(@referential, @competency)
    add_breadcrumb @resource
  end

  # GET /resources/new
  def new
    @competency = Referential::Competency.find params[:competency_id]
    @resource.competency = @competency
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, referential_competency_path(@referential, @competency)
    add_breadcrumb 'Nouvelle ressource'
  end

  # GET /resources/1/edit
  def edit
    @competency = @resource.competency
    add_breadcrumb @referential, @referential
    add_breadcrumb @competency, referential_competency_path(@referential, @competency)
    add_breadcrumb @resource, referential_resource_path(@referential, @resource)
    add_breadcrumb 'Modifier'
  end

  # POST /resources
  # POST /resources.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to referential_resource_path(@referential, @resource), notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to referential_resource_path(@referential, @resource), notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to @referential, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    params.require(:referential_resource).permit(:name, :description, :competency_id)
  end
end