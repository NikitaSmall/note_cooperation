module ApplicationHelper
  def cp(path)
    current_route = Rails.application.routes.recognize_path(path)
    if current_page?(path)
      return "active"
    elsif action_name == current_route[:action_name]
      return "active"
    end
    return ""
  end
end
