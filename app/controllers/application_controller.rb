class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(exception)
    @exception = exception
    render 'errors/not_found', status: :not_found, layout: 'error'
  end

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
