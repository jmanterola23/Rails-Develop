class RoomsController < ApplicationController
    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find(params[:id])
        @meets = Meet.where(room_id: @room.id) # Asegúrate de cargar las reuniones para esta sala
        Rails.logger.debug "Meets for room #{@room.name}: #{@meets.inspect}"
    
    end
  end
  