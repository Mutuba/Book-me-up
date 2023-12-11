# app/services/google_calendar_service.rb
class GoogleCalendarService
  def initialize(user)
    @user = user
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.authorization = user.google_token # Assuming you have stored the user's Google token
  end

  def get_primary_calendar
    result = @service.get_calendar('primary')
    puts "Calendar Summary: #{result.summary}"
    result
  end

  def add_event(event_params)
    # Example event_params: { summary: 'Availability Slot', start_time: '2023-01-01T08:00:00', end_time: '2023-01-01T09:00:00' }

    event = Google::Apis::CalendarV3::Event.new(
      summary: event_params[:summary],
      start: { date_time: event_params[:start_time], time_zone: 'UTC' },
      end: { date_time: event_params[:end_time], time_zone: 'UTC' }
    )

    @service.insert_event('primary', event)
  end
end