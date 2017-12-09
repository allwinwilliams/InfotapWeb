class User::DepartmentsUsersController < UserController
  def index

    if params[:q]
      @feeds = Feed.search(params[:q])
    else
      departments_users=DepartmentUser
                        .select('departments.id')
                        .joins(:department)
                        .where('departments_users.user' => current_user)
      @feeds = Feed
                .where(department_id: departments_users)
                .order({ updated_at: :desc })
    end
  end

  def subscribe
    department=Department.find(department_user_params[:id])
    department_user =DepartmentUser.create(department: department, user: current_user)
    redirect_to (:back)
  end

  def unsubscribe
    department=Department.find(department_user_params[:id])

    department_user =DepartmentUser.where(department: department, user: current_user)
    DepartmentUser.destroy(department_user)
    redirect_to  (:back)
  end

  private

   def department_user_params
     params.require(:department).permit(:id)
   end

end
