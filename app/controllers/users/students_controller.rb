class Users::StudentsController < Users::ApplicationController
  load_and_authorize_resource :student,
                              through: :user,
                              class: 'User::Student'

  # GET /user/students
  # GET /user/students.json
  def index
    @new_student = User::Publication.new user: @user
    breadcrumb
  end

  # GET /user/students/1
  # GET /user/students/1.json
  def show
    breadcrumb
  end

  # GET /user/students/new
  def new
    breadcrumb
    add_breadcrumb 'Nouvelle candidature'
  end

  # GET /user/students/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /user/students
  # POST /user/students.json
  def create
    respond_to do |format|
      if @student.save
        @group = @student.group
        @program = @group.program
        format.html { redirect_to program_group_path(@program, @group), notice: 'Vous inscription est enregistrée.' }
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
    params.require(:user_student).permit(:user_id, :group_id, :confirmed)
  end
end
