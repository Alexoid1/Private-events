class InvitationsController < ApplicationController
  def create
    event = Event.find(params[:attended_event_id])
    user = User.find(params[:event_attendee_id])
    event.event_attendees << user
    if event.save
      redirect_to event_path(event)
    else
      flash[:alert] = 'Unable to send invite'

    end
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end
end
