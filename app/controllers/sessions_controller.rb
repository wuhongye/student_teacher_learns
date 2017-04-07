class SessionsController < ApplicationController
        
        def new
        end

        def create
                if params[:session][:mold].eql? 'Student'
                     student = Student.authenticate(params[:session][:name], params[:session][:password])
                     if student 
                        signin_user student
                        redirect_to student_path(student)
                     else
                        render action: :new
                     end
                 elsif params[:session][:mold].eql?'Teacher'
                     teacher = Teacher.authenticate(params[:session][:name], params[:session][:password])
                     if teacher
                        signin_user teacher
                        redirect_to teacher_path(teacher)
                     else
                        render action: :new
                     end
                 else
                    render action: :new
                 end
         end           

        def destroy
            logout_user
            flash[:notice] = "退出成功"
            redirect_to root_path
        end
        
end