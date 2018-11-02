class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  layout "jobsnew",  only: [:new, :edit]

  # GET /jobs
  # GET /jobs.json
  def index
    @company = Company.find(params[:company_id])
    @jobs = Job.where(id: @company.jobs_id)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @company = Company.find(params[:company_id])
  end

  # GET /jobs/new
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
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @company = Company.find(params[:company_id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @company = Company.find(params[:company_id])
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
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
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
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

    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description)
    end
end
