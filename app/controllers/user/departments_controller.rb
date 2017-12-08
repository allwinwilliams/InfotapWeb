class User::DepartmentsController < UserController
  before_action :set_department, only: [:show]

  def index
      @department_user_ids=DepartmentUser
                            .select('departments.id')
                            .joins(:department)
                            .where('departments_users.user' => current_user)
                            .collect{|x| x.id}
      @departments=Department.all.order({ updated_at: :desc })
      @department=Department.new
  end


  def show
    @department = Department.find(params[:id])
  end


  def show_feeds
    if params[:id]
      @department=Department.find(params[:id])
      @feeds = Feed.all.order({ updated_at: :desc })
    else
      @departments=Department.all.order({ updated_at: :desc })
    end
  end


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
