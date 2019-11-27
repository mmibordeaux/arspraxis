class Users::EvaluationsController < Users::ApplicationController
  load_and_authorize_resource :evaluation,
                              through: :user,
                              class: 'User::Evaluation'

  # GET /user/evaluations
  # GET /user/evaluations.json
  def index
    breadcrumb
  end

  # GET /user/evaluations/1
  # GET /user/evaluations/1.json
  def show
    @publication = @evaluation.publication
    @critical_learning = @evaluation.critical_learning
    breadcrumb
  end

  # GET /user/evaluations/new
  def new
    @publication = User::Publication.find params[:publication_id]
    @critical_learning = Referential::CriticalLearning.find params[:critical_learning_id]
    @evaluation.publication = @publication
    @evaluation.referential_critical_learning = @critical_learning
    breadcrumb
    add_breadcrumb 'Nouvelle évaluation'
  end

  # GET /user/evaluations/1/edit
  def edit
    @publication = @evaluation.publication
    @critical_learning = @evaluation.critical_learning
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /user/evaluations
  # POST /user/evaluations.json
  def create
    @evaluation.user = current_user
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to user_evaluation_path(@user, @evaluation), notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: user_evaluation_path(@user, @evaluation) }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/evaluations/1
  # PATCH/PUT /user/evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to user_evaluation_path(@user, @evaluation), notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: user_evaluation_path(@user, @evaluation) }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/evaluations/1
  # DELETE /user/evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to user_evaluations_url(@user), notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Evaluations', user_evaluations_path(current_user)
    add_breadcrumb @evaluation, user_evaluation_path(current_user, @evaluation) if @evaluation && @evaluation.persisted?
  end

  private

  def evaluation_params
    params.require(:user_evaluation).permit(:publication_id, :referential_critical_learning_id, :completeness_validated, :completeness_comment, :authenticity_validated, :authenticity_comment, :validity_validated, :validity_comment, :depth_validated, :depth_comment, :extent_validated, :extent_comment, :explanation_validated, :explanation_comment)
  end
end
