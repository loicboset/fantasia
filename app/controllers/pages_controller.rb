class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    @character = Character.new
  end

end
