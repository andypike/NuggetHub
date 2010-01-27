# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tag_path(tag)
    "/tags/#{CGI::escape(tag.name).gsub(".", "%2E")}"
  end
end
