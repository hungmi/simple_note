class ServiceWorkersController < ApplicationController
  protect_from_forgery except: :service_worker
  skip_after_action :verify_authorized

  def service_worker
  end

  def manifest
  	render "manifest.json"
  end

  def offline
  end
end