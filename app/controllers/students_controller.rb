class StudentsController < ApplicationController
    
        def index
            @students = Student.where(mold: 'Student').page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
        end

        def new
            @student = Student.new        
      end

      def create
            @student = student.new(student_attrs)       
            if @student.save
                flash[:notice] = "学生创建成功"
                redirect_to students_path
            else
                flash[:notice] = "学生创建失败"
                render action: :new 
            end 
      end

        def show
            @student = Student.find(params[:id])
        end

        def edit
            @student = Student.find(params[:id])
        end

        def update
            @student = Student.find(params[:id])
            @student.attributes = student_attr
            if @student.save
                flash[:notice] = "学生信息更新成功"
                redirect_to students_path
            else
                flash[:notice] = "学生信息更新失败"
                redirect_to :back
            end
        end

        def search
            @students = Student.page(params[:page] || 1).per_page(params[:per_page] || 10)
               .order("id desc").where(["name like ?", "%#{params[:name]}%"])

               render action: :index
        end

        private
        def student_attr
            params.require(:student).permit(:name)
        end

        def student_attrs
            params.require(:student).permit(:name, :password, :password_confirmation, :mold)
        end
end