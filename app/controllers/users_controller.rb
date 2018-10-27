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

  def match
    @user = User.find(params[:id])
    @companies = Company.all
    #@jobs = Job.where(id: user.jobs_id)
  end

  # GET /users/new
  def new
    @jobtypes = ['Architecture_and_Engineering_Occupations',
                  'Arts_Design_Entertainment_Sports_and_Media_Occupations',
                  'Building_and_Grounds_Cleaning_and_Maintenance_Occupations',
                  'Business_and_Financial_Operations_Occupations',
                  'Community_and_Social_Services_Occupations',
                  'Computer_and_Mathematical_Occupations',
                  'Construction_and_Extraction_Occupations',
                  'Education_Training_and_Library_Occupations',
                  'Farming_Fishing_and_Forestry_Occupations',
                  'Food_Preparation_and_Serving_Related_Occupations',
                  'Healthcare_Practitioners_and_Technical_Occupations',
                  'Healthcare_Support_Occupations',
                  'Installation_Maintenance_and_Repair_Occupations',
                  'Legal_Occupations',
                  'Life_Physical_and_Social_Science_Occupations',
                  'Management_Occupations',
                  'Military_Specific_Occupations',
                  'Office_and_Administrative_Support_Occupations',
                  'Personal_Care_and_Service_Occupations',
                  'Production_Occupations',
                  'Protective_Service_Occupations',
                  'Sales_and_Related_Occupations'
              ]
    @user = User.new
  end

  # GET /users/1/edit
  def edit
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
