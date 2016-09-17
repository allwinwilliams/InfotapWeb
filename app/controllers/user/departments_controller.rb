class User::DepartmentsController < UserController
  before_action :authenticate_user!
  before_action :set_department, only: [:show]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])
  end

  # GET /departments/new


  # GET /departments/1/edit


  # POST /departments
  # POST /departments.json



  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json


  # DELETE /departments/1
  # DELETE /departments/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name)
    end
end
