class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_job, only: [:show, :edit, :update, :destroy]
  layout "usernew",  only: [:new, :edit]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #@jobs = Job.where(id: user.jobs_id)
  end

  def splash
    render :layout => "splash"
  end

  def match
    @user = User.find(params[:user_id])
    #@jobs = Job.where(id: user.jobs_id)
  end

  # GET /users/new
  def new
    @jobtypes = [
      "Architecture and Engineering Occupations",
      "Arts Design Entertainment Sports and Media Occupations",
      "Building and Grounds Cleaning and Maintenance Occupations",
      "Business and Financial Operations Occupations",
      "Community and Social Services Occupations",
      "Computer and Mathematical Occupations",
      "Construction and Extraction Occupations",
      "Education Training and Library Occupations",
      "Farming Fishing and Forestry Occupations",
      "Food Preparation and Serving Related Occupations",
      "Healthcare Practitioners and Technical Occupations",
      "Healthcare Support Occupations",
      "Installation Maintenance and Repair Occupations",
      "Legal Occupations",
      "Life Physical and Social Science Occupations",
      "Management Occupations",
      "Military Specific Occupations",
      "Office and Administrative Support Occupations",
      "Personal Care and Service Occupations",
      "Production Occupations",
      "Protective Service Occupations",
      "Sales and Related Occupations"
    ]
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @jobtypes = [
        "Architecture and Engineering Occupations",
        "Arts Design Entertainment Sports and Media Occupations",
        "Building and Grounds Cleaning and Maintenance Occupations",
        "Business and Financial Operations Occupations",
        "Community and Social Services Occupations",
        "Computer and Mathematical Occupations",
        "Construction and Extraction Occupations",
        "Education Training and Library Occupations",
        "Farming Fishing and Forestry Occupations",
        "Food Preparation and Serving Related Occupations",
        "Healthcare Practitioners and Technical Occupations",
        "Healthcare Support Occupations",
        "Installation Maintenance and Repair Occupations",
        "Legal Occupations",
        "Life Physical and Social Science Occupations",
        "Management Occupations",
        "Military Specific Occupations",
        "Office and Administrative Support Occupations",
        "Personal Care and Service Occupations",
        "Production Occupations",
        "Protective Service Occupations",
        "Sales and Related Occupations"
    ]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
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
      params.require(:user).permit(:name, :email, :password, :age, :phonenum, :resume, :jobs_id, :jobtype => [])
    end
end
