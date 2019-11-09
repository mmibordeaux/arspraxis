class Programs::TeachersController < Programs::ApplicationController
  load_and_authorize_resource :teacher,
                              through: :program,
                              class: 'Program::Teacher'

  # GET /program/teachers
  # GET /program/teachers.json
  def index
    breadcrumb
  end

  # GET /program/teachers/1
  # GET /program/teachers/1.json
  def show
    breadcrumb
  end

  # GET /program/teachers/new
  def new
    @teacher.program = @program
    breadcrumb
    add_breadcrumb 'Nouvel enseignant'
  end

  # GET /program/teachers/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /program/teachers
  # POST /program/teachers.json
  def create
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to program_teacher_path(@program, @teacher), notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program/teachers/1
  # PATCH/PUT /program/teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to program_teacher_path(@program, @teacher), notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program/teachers/1
  # DELETE /program/teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to program_teachers_path(@program), notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Enseignants', program_teachers_path(@program)
    add_breadcrumb @teacher, program_group_path(@program, @teacher) if @teacher && @teacher.persisted?
  end

  private

  def teacher_params
    params.require(:program_teacher).permit(:program_id, :user_id, :role, :details)
  end
end
