class HomeController < ApplicationController
  def show
    render partial: 'shared/users'
  end
end
