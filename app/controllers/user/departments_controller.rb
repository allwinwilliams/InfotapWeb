class User::DepartmentsController < UserController
  before_action :set_department, only: [:show]
  # GET /departments
  # GET /departments.json
  def index
    if params[:id]
      @department=Department.find(params[:id])
      @feeds = Feed.all.order({ updated_at: :desc })
    else
      @departments=Department.all.order({ updated_at: :desc })
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])
  end

  # GET /departments/new
  def show_feeds
    if params[:id]
      @department=Department.find(params[:id])
      @feeds = Feed.all.order({ updated_at: :desc })
    else
      @departments=Department.all.order({ updated_at: :desc })
    end
  end

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
