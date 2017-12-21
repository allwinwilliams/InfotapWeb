class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessor :email, :password, :password_confirmation, :remember_me, :name
  # Include default devise modules.
          #:confirmable, :omniauthable
  # Include default devise modules.
  def is_subscribed?(department)
    departments_user=DepartmentUser.where(:user_id => self.id,:department_id => department.id)
    if departments_user.blank?
      return false
    else
      return true
    end
  end
  def subscribed_department_ids()
    return DepartmentUser.where(:user_id => self.id).collect{ |x| x.department_id }
  end
end
