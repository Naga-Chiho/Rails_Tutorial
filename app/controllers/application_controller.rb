class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :breadcrumbs

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  stale_when_importmap_changes
end
