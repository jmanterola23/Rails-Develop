class MeetAssigns
    def initialize(meets)
        @meets = meets
    end

    def assign
        @meets.each do |meet|
            room_assign = Room.all.find do |room|
                room_available?(room, meet)
            end

            if room_assign

                schedule = "#{meet.start_hour.strftime('%H:%M')} - #{meet.end_hour.strftime('%H:%M')}"
                Assign.create(room: room_assign, meet: meet, schedule:schedule)
            else
                puts"No se pudo asignar la reunión #{meet.id}"


    
            end
        end
    end

    private

    def room_available?(room, meet)
        available_schedule = in_available_schedule?(room, meet)
        not_conflict = not_conflict_with_other_meets?(room, meet)
        available_schedule && not_conflict
    end

    def in_available_schedule(room, meet)
        start_availability, end_availability = room.available_schedule.split(' - ').map { |h| Time.parse(h) }
        start_meet = meet.start_hour
        end_meet = meet.end_hour
        start_availability <= start_meet && end_meet <= end_availability
    end

    def not_conflict_with_other_meets?(room, meet)
        assigns = room.assigns
        assigns.none? do |assign|
            existing_meet = assign.meet
            start_meet = meet.start_hour
            end_meet = meet.end_hour

            existing_start = Time.parse(assign.schedule.split(' - ').first)
            existing_end = Time.parse(assign.schedule.split(' - ').last)

            start_meet < existing_end && end_meet > existing_start
        end
    end
end