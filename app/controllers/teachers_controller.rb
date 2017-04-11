class TeachersController < ApplicationController

      def index
          @teachers = Teacher.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id desc")
      end

      def new
            @teacher = Teacher.new        
      end

      def create
            @teacher = Teacher.new(teacher_attrs)       
            if @teacher.save
                flash[:notice] = "老师创建成功"
                redirect_to teachers_path
            else
                flash[:notice] = "老师创建失败"
                render action: :new 
            end 
      end

      def show
            @teacher = Teacher.find(params[:id])
       end

       def edit
            @teacher = Teacher.find(params[:id])            
       end

       def update
            @teacher = Teacher.find(params[:id])
            @teacher.attributes = teacher_attr
            if @teacher.save
                flash[:notice] = "老师信息更新成功"
                redirect_to user_path(current_user)
            else
                flash[:notice] = "老师信息更新失败"
                redirect_to :back
            end
        end

        def search
            @teachers = Teacher.page(params[:page] || 1).per_page(params[:per_page] || 10)
               .order("id desc").where(["name like ?", "%#{params[:name]}%"])

               render action: :index                                              
        end

        private
        def teacher_attrs
            params.require(:teacher).permit(:name, :password, :password_confirmation)
        end

        def teacher_attr
            params.require(:teacher).permit(:name)
        end
end