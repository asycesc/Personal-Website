class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include WhiteList

  include SetSource
end
