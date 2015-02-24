class MapController < ApplicationController
  def index
    @test = current_user;
  end
end
