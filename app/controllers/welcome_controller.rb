class WelcomeController < ApplicationController
  def index
  	DoStuffJob.perform_later
  end
end
