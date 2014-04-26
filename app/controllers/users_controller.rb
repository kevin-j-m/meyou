class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    session[:sign_up_status] = nil
    session[:user_params] = {}
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #user_params only references last post, must include prior steps
    #save prior params in the session, create the user with the session params
    session[:user_params] = session[:user_params].merge(user_params)
    @user = User.new(session[:sign_up_status], session[:user_params])

    if @user.valid?
      if @user.sign_up_finished?
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render action: 'show', status: :created, location: @user }
          else
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else #move to the next step, continue data entry
        session[:sign_up_status] = @user.next_sign_up_status
        render 'new'
      end
    else #re-render page, show validation errors
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :middle_initial, :last_name, :email, :street1, :street2, :city, :state, :zip, :phone, :favorite_food, :favorite_artist, :company, :title, :department, :last_movie_seen, :college_degree, :college, :website, :twitter_user_name, :photo_path, :join_date)
    end
end
