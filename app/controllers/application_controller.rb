class ApplicationController < ActionController::Base
  protect_from_forgery

  def raiser(fo = nil)
    raise fo.inspect
  end
end
