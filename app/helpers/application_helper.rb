
module ApplicationHelper
  def tag_path(tag)
    CGI::escape(tag.name).gsub(".", "%2E")
  end
end
