class EventsController < ApplicationController
  def index
    @groups = Group.all
  end
end
