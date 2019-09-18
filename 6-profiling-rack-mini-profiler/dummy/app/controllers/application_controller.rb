class ApplicationController < ActionController::Base
  def home
    redirect_to authors_path
  end
end
