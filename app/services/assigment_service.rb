class AssigmentService
    def initialize(rooms, meets)
        @rooms = rooms
        @meets = meets
    end

    def assign_meets
        @meets.each do |meet|
            room = find_available_room(meet)
            if room
                create_assignment(room, meet)
            else
                notify_conflict(meet)
            end
        end
    end

    private

    def find_available_room(meet)
        @rooms.each do |room|
            if room_can_host_meet?(room, meet)
                return room
            end
        end
        nil
    end

    def room_can_host_meet?(room, meet)
        # Check if room has enough capacity
        return false if room.max_capacity < meet.cant_asist

        # Check room's schedule for conflicts
        room.assigns.each do |assign|
            if time_overlap?(assign.start_time, assign.end_time, meet.start_hour, meet.end_hour)
                return false
            end
        end

        true
    end

    def time_overlap?(start1, end1, start2, end2)
        # Verifies if time intervals overlap
        start1 < end2 && start2 < end1
    end

    def create_assignment(room, meet)
        Assign.create(room: room, meet: meet, start_time: meet.start_hour, end_time: meet.end_hour)
    end

    def notify_conflict(meet)
        puts "Conflicto: No hay una sala disponible para la reunión #{meet.description}"
    end
end