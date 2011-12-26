class ApplicationController < ActionController::Base
  load 'lib/esv.rb'
  helper_method :esv_bible
  protect_from_forgery

  def esv_bible
    ESVBible.new
  end
end
