module ApplicationHelper
  def current_class(path)
    current_page?(path) ? "current" : ""
  end
end
