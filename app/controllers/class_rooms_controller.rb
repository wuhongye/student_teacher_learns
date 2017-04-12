class ClassRoomsController < ApplicationController
    
    def index
        @class_rooms = ClassRoom.page(params[:id] || 1).per_page(params[:per_page] || 10).order("id desc")
    end
    

    def search
        @class_rooms = ClassRoom.page(params[:page] || 1).per_page(params[:per_page] || 10)
               .order("id desc").where(["roomname like ?", "%#{params[:roomname]}%"])

               render action: :index        
    end

    def get_teachers
            class_room = ClassRoom.find params[:id]            
            @teachers = class_room.users.where("mold = 'Teacher' ").all
        end

end