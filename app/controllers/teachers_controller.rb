class TeachersController < ApplicationController

      def show
            @teacher = Teacher.find(params[:id])
       end

       def update
            @teacher = Teacher.find(params[:id])
            @teacher.attributes = teacher_attrs
            if @teacher.save
                flash[:notice] = "老师信息更新成功"
                redirect_to user_path(current_user)
            else
                flash[:notice] = "老师信息更新失败"
                redirect_to :back
            end
        end

        private
        def student_attrs
            params.require(:teacher).permit(:name)
        end
end