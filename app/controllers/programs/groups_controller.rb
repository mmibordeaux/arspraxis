class Programs::GroupsController < Programs::ApplicationController
  load_and_authorize_resource :group,
                              through: :program,
                              class: 'Program::Group'

  # GET /groups
  # GET /groups.json
  def index
    @new_group = Program::Group.new program: @program
    breadcrumb
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    breadcrumb
  end

  # GET /groups/new
  def new
    @program = Program.find params[:program_id]
    @group.program = @program
    breadcrumb
    add_breadcrumb 'Nouvelle promotion'
  end

  # GET /groups/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /groups
  # POST /groups.json
  def create
    respond_to do |format|
      if @group.save
        format.html { redirect_to program_group_path(@program, @group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to program_group_path(@program, @group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to @program, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Promotions', program_groups_path(@program)
    add_breadcrumb @group, program_group_path(@program, @group) if @group && @group.persisted?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:program_group).permit(:year, :program_id)
    end
end
