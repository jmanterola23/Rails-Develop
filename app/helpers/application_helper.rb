# app/helpers/application_helper.rb
module ApplicationHelper
    def calendar_for_month(events:)
      month_calendar(events: events) do |date, meets|
        content_tag(:div, class: 'day') do
          concat content_tag(:span, date.day)
          if meets.any?
            meets.each do |meet|
              concat content_tag(:div, meet.description, class: 'event')
            end
          end
        end
      end
    end
  end
  

