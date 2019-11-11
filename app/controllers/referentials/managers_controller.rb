class Referentials::ManagersController < Referentials::ApplicationController
  load_and_authorize_resource :manager,
                              through: :referential,
                              class: 'Referential::Manager'

  # GET /referential/managers
  # GET /referential/managers.json
  def index
    @new_manager = Referential::Manager.new referential: @referential
    breadcrumb
  end

  # GET /referential/managers/1
  # GET /referential/managers/1.json
  def show
    breadcrumb
  end

  # GET /referential/managers/new
  def new
    breadcrumb
    add_breadcrumb 'Nouveau gestionnaire'
  end

  # GET /referential/managers/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /referential/managers
  # POST /referential/managers.json
  def create
    respond_to do |format|
      if @manager.save
        format.html { redirect_to referential_manager_path(@referential, @manager), notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: referential_manager_path(@referential, @manager) }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referential/managers/1
  # PATCH/PUT /referential/managers/1.json
  def update
    respond_to do |format|
      if @manager.update(referential_manager_params)
        format.html { redirect_to referential_manager_path(@referential, @manager), notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: referential_manager_path(@referential, @manager) }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referential/managers/1
  # DELETE /referential/managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to referential_managers_url(@referential), notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Responsables', referential_managers_path(@referential)
    add_breadcrumb @manager, referential_manager_path(@referential, @manager) if @manager && @manager.persisted?
  end

  private

  def manager_params
    params.require(:referential_manager).permit(:referential_id, :user_id)
  end
end
