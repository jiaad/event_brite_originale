class EventController < ApplicationController
  def index
    @event = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(start_date: params[:start_date], 
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location], duration: params[:duration], admin: current_user)

      if @event.save
        flash[:notice] = "event successfully created"
        redirect_to 'event_index_path'
      else
        puts "="*90
       puts  @event.errors.full_messages
        puts "="*90
        render "new"
      end
  end
  def show
    @event = Event.find(params[:id])
  end
end
