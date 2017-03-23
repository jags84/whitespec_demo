class Api::GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]

  def index
    # Show Published Events
    @group_events = GroupEvent.get_all_events(params)
  end

  def show
  end

  def create
    # Create new Event
    @group_event = current_user.group_events.new(group_event_params)
    if @group_event.save
      @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  def update
    # Update Event
    if @group_event.update(group_event_params)
      @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # Mark for remove
    @group_event.mark_for_remove
    render status: 200
  end

  private
    # Set @group_event var for show update and destroy
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    # Params
    def group_event_params
      params.require(:group_event).permit(:name, :description, :start_date, :end_date, :publish_status, :user_id, :latitude, :longitude)
    end
end
