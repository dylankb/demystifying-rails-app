class ApplicationController < ActionController::Base
  def hello_world
    render plain: 'Hello Word!'
  end
end
