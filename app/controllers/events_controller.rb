class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :is_admin?, only: [:edit, :udpate, :destroy]

  def index
  end

  def show
    @event = Event.find(params[:id]) ### REPEATING
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      'title' => params[:title],
      'location' => params[:location],
      'start_date' => params[:start_date],
      'description' => params[:description],
      'duration' => params[:duration],
      'price' => params[:price],
      'admin_id' => current_user.id
    )
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id]) ### REPEATING
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to user_path(current_user.id)
  end

  private


  def is_admin? ### A METTRE DS LES HELPERS?
    @event = Event.find(params[:id]) ### REPEATING
    current_user.id.to_i == @event.admin.id.to_i
    # FLASH ERROR
  end

  def event_params
    params.permit(:title, :location, :start_date, :description, :duration, :price)
  end

end
