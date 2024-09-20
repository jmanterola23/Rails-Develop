class Meet < ApplicationRecord
    has_many :assigns
    has_many :rooms, through: :assigns
    belongs_to :room
    validates :description, presence: true
    validates :estimated_time, numericality: { greater_than: 0 }
    validates :cant_asist, numericality: { greater_than: 0 }
    validates :start_hour, presence: true
    #validates :end_hour, presence: true
  
    # Callback para establecer `end_hour` antes de guardar el registro
    before_save :set_end_hour
    def start_time
        start_hour
    end

    def end_time
        end_hour
    end
    private
  
    def set_end_hour
        puts "######Start Hour: #{start_hour}"  # Para depuración
        puts "##########Estimated Time: #{estimated_time}"  # Para depuración
    
        if start_hour.present? && estimated_time.present?
            self.end_hour = start_hour + estimated_time.minutes
            puts "Calculated End Hour: #{end_hour}"  # Para depuración
        else
            self.end_hour = nil
        end
    end
end
  
