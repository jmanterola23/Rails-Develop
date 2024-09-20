class MeetsController < ApplicationController
    before_action :set_meet, only: [:show, :destroy]
    before_action :set_room, only: [:new, :create]

    def index
        @meets = Meet.all
    end

    def show
        @meets = Meet.where(room_id: params[:room_id])
        @rooms = Room.all # Asegúrate de que @rooms se inicializa aquí
        respond_to do |format|
            format.html # para el navegador
            format.js   # para la solicitud AJAX
        end
    end

    def new
        @meet = Meet.new
    end

    def create
        @meet = Meet.new(meet_params)
        @meet.room_id = @room.id # Asigna el room_id de @room

         # Calcular estimated_time
        start_time = @meet.start_hour
        end_time = @meet.end_hour
        if start_time && end_time
            @meet.estimated_time = (end_time - start_time) / 60 # en minutos
        end
    
        puts "Params: #{meet_params.inspect}"  # Depuración
        if @meet.save
            if Room.any?
                # Asigna las reuniones aquí si es necesario
                rooms = Room.all
                AssigmentService.new(rooms, [@meet]).assign_meets
                
                redirect_to room_path(@room), notice: 'Reunión creada con éxito.'
            else
                puts @meet.errors.full_messages  # Depuración
                redirect_to @meet, alert: 'No hay salas disponibles para asignar'
            end
        else
            puts @meet.errors.full_messages
            render :new
        end
    end

      

    def destroy
        @meet = Meet.find(params[:id])
        @meet.destroy
        redirect_to meets_url, notice: 'Reunión eliminada.'
    end

    private

    def set_room
        @room = Room.find(params[:room_id]) if params[:room_id] # Cargar la sala si se pasa el ID
    end

    def set_meet
        @meet = Meet.find(params[:id])
    end
    
    def meet_params
        params.require(:meet).permit(:description, :estimated_time, :cant_asist, :start_hour, :end_hour, :room_id)
    end
    
end