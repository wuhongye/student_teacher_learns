class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new
        if params[:user][:mold] == "Student"
            @student = Student.new(user_attrs)
            if @student.save
                signin_user @student
                redirect_to student_path(@student)
            else
                render action: :new
            end
        elsif params[:user][:mold] == "Teacher"
            @teacher = Teacher.new(user_attrs)
            if @teacher.save
                   signin_user @teacher
                   redirect_to teacher_path(@teacher)
            else
                    render action: :new
            end
        else
             render action: :new            
        end
    end

    def show
            @class_rooms = ClassRoom.all
            @students = Student.all
            @teachers = Teacher.all
    end

    def edit
            @user = User.find(params[:id])
            @class_rooms = ClassRoom.all
    end

    def update
            class_room = nil
            class_room = ClassRoom.find(params[:classroom][:id]) unless params[:classroom][:id].blank?
            user = User.find(params[:id])
            user.class_rooms.clear
            if class_room.nil? || user.nil?
                    redirect_to user_path(current_user)
                    return
            end
            user.class_rooms << class_room
            redirect_to user_path(current_user)
    end

    def destroy
            User.find(params[:id]).destroy unless params[:id].eql? current_user.id.to_s
            redirect_to user_path(current_user)
    end

    def create_room
            class_room = nil
            class_room = ClassRoom.find_by(roomname:params[:roomname])
            if class_room.nil?
                    class_room = ClassRoom.create(roomname: params[:roomname])
            end
                    redirect_to class_rooms_path
    end

    def destroy_room
            ClassRoom.find(params[:id]).destroy
            redirect_to user_path
    end

    private
    def user_attrs
    params.require(:user).permit(:name, :admin, :password,:password_confirmation,:mold)
    end
end