class ProgramsController < ApplicationController
  load_and_authorize_resource

  # GET /programs
  # GET /programs.json
  def index
    breadcrumb
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    breadcrumb
  end

  # GET /programs/new
  def new
    @program.referential_id = params[:referential_id]
    breadcrumb
    add_breadcrumb 'Nouvelle formation'
  end

  # GET /programs/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Formations', programs_path
    add_breadcrumb @program, @program if @program && @program.persisted?
  end

  private

  def program_params
    params.require(:program).permit(:name, :city, :country, :referential_id)
  end
end
