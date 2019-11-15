class Users::StudentsController < Users::ApplicationController
  load_and_authorize_resource :students,
                              through: :user,
                              class: 'User::Student'

  # GET /user/students
  # GET /user/students.json
  def index
  end

  # GET /user/students/1
  # GET /user/students/1.json
  def show
  end

  # GET /user/students/new
  def new
    @student = User::Student.create(user: current_user, program_group_id: params[:program_group_id])
    redirect_to program_group_path(@student.group.program, @student.group)
  end

  # GET /user/students/1/edit
  def edit
  end

  # POST /user/students
  # POST /user/students.json
  def create
    respond_to do |format|
      if @student.save
        format.html { redirect_to user_student_path(@user, @student), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: user_student_path(@user, @student) }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/students/1
  # PATCH/PUT /user/students/1.json
  def update
    @student = User::Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to user_student_path(@user, @student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: user_student_path(@user, @student) }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/students/1
  # DELETE /user/students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to user_students_url(@user), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Etudiants', user_students_path(@user)
    add_breadcrumb @student, user_student_path(@user, @student) if @student && @student.persisted?
  end


  private

  def student_params
    params.require(:user_student).permit(:user_id, :program_group_id, :confirmed)
  end
end
