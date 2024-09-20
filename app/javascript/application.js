// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
    const startHourInput = document.getElementById('start_hour');
    const endHourInput = document.getElementById('end_hour');
    const estimatedTimeInput = document.getElementById('estimated_time');

    function calculateEstimatedTime() {
        const startDate = new Date(startHourInput.value);
        const endDate = new Date(endHourInput.value);

        if (!isNaN(startDate) && !isNaN(endDate)) {
            const estimatedTime = Math.round((endDate - startDate) / 60000); // Diferencia en minutos
            estimatedTimeInput.value = estimatedTime >= 0 ? estimatedTime : 0; // Evitar valores negativos
        }
    }

    startHourInput.addEventListener('change', calculateEstimatedTime);
    endHourInput.addEventListener('change', calculateEstimatedTime);
});
