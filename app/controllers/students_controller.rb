class StudentsController < ApplicationController
    
        def show
            @student = Student.find(params[:id])
        end

        def edit
            @student = Student.find(params[:id])
        end

        def update
            @student = Student.find(params[:id])
            @student.attributes = student_attrs
            if @student.save
                flash[:notice] = "学生信息更新成功"
                redirect_to user_path(current_user)
            else
                flash[:notice] = "学生信息更新失败"
                redirect_to :back
            end
        end

        private
        def student_attrs
            params.require(:student).permit(:name)
        end

end