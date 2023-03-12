class AdminController < ApplicationController
	layout "admin"
	rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

	private
		def handle_record_not_found
      respond_to do |format|
        format.html { render plain: "Not found.", status: 404 }
      end
    end
end