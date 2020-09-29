class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authorize, except: %i[index show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @users = User.all
    @user = current_user
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @users = User.all
    @user = current_user
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
    @event = current_user.events.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = current_user.events.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :location, :time, :image)
  end
end
