class Users::PublicationsController < Users::ApplicationController
  load_and_authorize_resource :publication,
                              through: :user,
                              class: 'User::Publication'

  # GET /user/publications
  # GET /user/publications.json
  def index
    @publications = @publications.published
    @new_publication = User::Publication.new user: @user
    breadcrumb
  end

  # GET /user/publications/1
  # GET /user/publications/1.json
  def show
    breadcrumb
  end

  # GET /user/publications/new
  def new
    breadcrumb
    add_breadcrumb 'Nouvelle publication'
  end

  # GET /user/publications/1/edit
  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  # POST /user/publications
  # POST /user/publications.json
  def create
    respond_to do |format|
      if @publication.save
        format.html { redirect_to user_publication_path(@user, @publication), notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: user_publication_path(@user, @publication) }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/publications/1
  # PATCH/PUT /user/publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to user_publication_path(@user, @publication), notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: user_publication_path(@user, @publication) }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/publications/1
  # DELETE /user/publications/1.json
  def destroy
    @user_publication.destroy
    respond_to do |format|
      format.html { redirect_to user_publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Publications', user_publications_path(@user)
    add_breadcrumb @publication, user_publication_path(@user, @publication) if @publication && @publication.persisted?
  end

  private

  def publication_params
    params.require(:user_publication).permit(:user_id, :program_group_id, :title, :content, :published)
  end
end
