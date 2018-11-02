class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
  layout "jobsnew",  only: [:new, :edit]
=======
    layout "jobnew",  only: [:new, :edit]
>>>>>>> 9108c620381130693b4c8ae7af687015cc984d5d

  # GET /jobs
  # GET /jobs.json
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @company = Company.find(params[:company_id])
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
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  # GET /jobs/1/edit
  def edit
    @company = Company.find(params[:company_id])
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

  # POST /jobs
  # POST /jobs.json
  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to [@company, @job], notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @company = Company.find(params[:company_id])
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to [@company, @job], notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @company = Company.find(params[:company_id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @company = Company.find(params[:company_id])
      @job = @company.jobs
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description, :jobtype, params[:company_id])
    end
end
