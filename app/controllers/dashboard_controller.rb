class DashboardController < ApplicationController
  def index
    if user_signed_in?
      render 'signed_in'
    else
      render 'anonymous'
    end
    breadcrumb
  end
end
