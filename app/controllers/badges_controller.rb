class BadgesController < ApplicationController
  
  def index
    @badges = Badge.select(:image).distinct
  end
end
